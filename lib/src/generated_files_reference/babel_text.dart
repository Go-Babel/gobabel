import 'package:gobabel/src/generated_files_reference/babel_text_dependencies.dart';

const String babelText = '''${babelTextDependencies}class Babel {
  static Babel? _instance;
  static late final SharedPreferences _prefs;
  final SharedPreferencesAsync _asyncPrefs = SharedPreferencesAsync();
  // Singleton pattern, avoid self instance
  Babel._();
  static Babel get instance => _instance ??= Babel._();
  static Babel get i => _instance ??= Babel._();

  final Map<String, String> translationsMap = {};
  late BabelSupportedLocales selectedLanguage;

  final Completer<List<BabelSupportedLocales>> _allLanguages = Completer();
  Completer<List<BabelSupportedLocales>> get allLanguages {
    if (!_allLanguages.isCompleted) {
      _fetchLanguages().then((languages) {
        if (allLanguages.isCompleted) return;

        _allLanguages.complete(languages);
      });
    }
    return _allLanguages;
  }

  Future<void> initialize({required SharedPreferences? prefs}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();

    final cacheLanguage = await _getCacheLanguage();
    final bool haveLanguageCache = cacheLanguage != null;

    if (haveLanguageCache) {
      selectedLanguage = cacheLanguage;
      final updateLink = await _fetchMostUpdatedArbDownloadLink(cacheLanguage);
      final isSameLink = await _isSameLinkAsCache(updateLink);
      if (isSameLink) {
        final cacheArbJson = await _getCacheArbJson();
        if (cacheArbJson != null) {
          translationsMap.addAll(cacheArbJson);
        } else {
          final arbJson = await _downloadArbJson(updateLink);
          translationsMap.addAll(arbJson);
          await _updateCacheArbJson(arbJson);
        }
      } else {
        final arbJson = await _downloadArbJson(updateLink);
        translationsMap.addAll(arbJson);
        await _updateCacheArbJson(arbJson);
        await _updateArbCacheLink(updateLink);
      }
    } else {
      final translations = await _fetchLanguages();
      _allLanguages.complete(translations);
      final defaultTranslation = await _determineDefaultSelectedTranslation(
        translations,
      );
      final arbLink = await _fetchMostUpdatedArbDownloadLink(
        defaultTranslation,
      );
      final arbJson = await _downloadArbJson(arbLink);
      translationsMap.addAll(arbJson);
      await _updateCacheArbJson(arbJson);
      await _updateArbCacheLink(arbLink);
      await _saveCacheLanguage(defaultTranslation);
      selectedLanguage = defaultTranslation;
    }
  }

  Future<Map<String, String>> _downloadArbJson(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to download arb json');
    }

    final decodedJson = jsonDecode(response.body) as Map;
    return decodedJson.cast<String, String>();
  }

  Future<void> changeLanguage(BabelSupportedLocales newLanguage) async {
    final allLanguages = await _allLanguages.future;
    if (!allLanguages.contains(newLanguage)) {
      throw Exception(
        'Language not supported. See supported languages by calling Babel.instance.allLanguages getter',
      );
    }
    final arbLink = await _fetchMostUpdatedArbDownloadLink(newLanguage);
    final arbJson = await _downloadArbJson(arbLink);
    translationsMap.clear();
    translationsMap.addAll(arbJson);
    await _updateCacheArbJson(arbJson);
    await _updateArbCacheLink(arbLink);
    await _saveCacheLanguage(newLanguage);
    selectedLanguage = newLanguage;
  }

  Future<Map<_TranslationKey, _TranslationContent>?> _getCacheArbJson() async {
    final cacheJson = await _asyncPrefs.getString('cacheArbJson');

    if (cacheJson == null) return null;

    return (jsonDecode(cacheJson) as Map)
        .cast<_TranslationKey, _TranslationContent>();
  }

  Future<void> _updateCacheArbJson(
    Map<_TranslationKey, _TranslationContent> arbJson,
  ) async {
    await _asyncPrefs.setString('cacheArbJson', jsonEncode(arbJson));
  }

  Future<BabelSupportedLocales?> _saveCacheLanguage(
    BabelSupportedLocales locale,
  ) async {
    await _prefs.setString('cacheLanguage', locale.toString());
    return locale;
  }

  Future<BabelSupportedLocales?> _getCacheLanguage() async {
    final language = _prefs.getString('cacheLanguage');
    if (language != null) {
      return BabelSupportedLocales.fromString(language);
    }
    return null;
  }

  Future<bool> _isSameLinkAsCache(String link) async {
    final cacheArbLink = _getCacheArbLink();
    return cacheArbLink == link;
  }

  Future<bool> _updateArbCacheLink(String link) async {
    return _prefs.setString('cacheLink', link);
  }

  String? _getCacheArbLink() {
    return _prefs.getString('cacheLink');
  }

  Future<String> _fetchMostUpdatedArbDownloadLink(
    BabelSupportedLocales translation,
  ) async {
    final resp = await http.get(
      Uri(
        host: _gobabelRoute,
        path: '/labels/arb_download_url',
        queryParameters: {
          'languageCode': translation.languageCode,
          'countryCode': translation.countryCode,
          'projectShaIdentifier': _projectShaIdentifier,
          'projectVersion': _projectVersion,
        },
      ),
    );

    if (resp.statusCode != 200) {
      throw Exception('Failed to fetch arb download link');
    }

    return resp.body;
  }

  Future<BabelSupportedLocales> _determineDefaultSelectedTranslation(
    List<BabelSupportedLocales> translations,
  ) async {
    final String locale;
    if (kIsWeb) {
      locale = html.window.navigator.language; // e.g., en-US, fr-FR, es-ES
    } else {
      locale = io.Platform.localeName;
    }
    final String localeLanguageCode =
        locale.contains('-') ? locale.split('-').first : locale;
    final String? localeCountryCode =
        locale.contains('-') ? locale.split('-').last : null;

    return BabelSupportedLocales.fromLocale(
          localeLanguageCode,
          localeCountryCode,
        ) ??
        (translations.contains(BabelSupportedLocales.enUS)
            ? BabelSupportedLocales.enUS
            : translations.first);
  }

  Future<List<BabelSupportedLocales>> _fetchLanguages() async {
    final resp = await http.get(
      Uri(
        host: _gobabelRoute,
        path: '/labels/available_locales',
        queryParameters: {
          'projectShaIdentifier': _projectShaIdentifier,
          'projectVersion': _projectVersion,
        },
      ),
    );

    if (resp.statusCode != 200) {
      throw Exception('Failed to fetch languages');
    }

    final locales =
        (jsonDecode(resp.body) as List)
            .cast<Map>()
            .map(BabelSupportedLocales.fromMap)
            .toList();

    return locales;
  }

  String _getByKey(String key) {
    return translationsMap[key]!;
  }

''';
