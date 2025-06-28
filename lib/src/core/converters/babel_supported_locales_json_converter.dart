import 'package:gobabel_core/gobabel_core.dart';
import 'package:json_annotation/json_annotation.dart';

/// JsonConverter for [BabelSupportedLocales] to be used with Freezed/json_serializable.
///
/// This converter handles nullable [BabelSupportedLocales?] instances,
/// serializing them to and from [Map<String, dynamic>?].
class BabelSupportedLocalesJsonConverter
    implements JsonConverter<BabelSupportedLocales, Map<String, dynamic>> {
  const BabelSupportedLocalesJsonConverter();

  @override
  BabelSupportedLocales fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw FormatException(
        'Cannot convert null json to BabelSupportedLocales',
      );
    }

    final Object? langCodeObj = json['languageCode'];
    final Object? countryCodeObj = json['countryCode'];

    // Validate that 'languageCode' is a String.
    if (langCodeObj is String) {
      // Type alias LanguageCode = String
      final LanguageCode languageCode = langCodeObj;
      CountryCode? countryCode; // Type alias CountryCode = String

      // Handle 'countryCode': it can be null or a String.
      if (countryCodeObj == null) {
        countryCode = null;
      } else if (countryCodeObj is String) {
        countryCode = countryCodeObj;
      } else {
        // MODIFIED: Throw exception for invalid countryCode type
        throw FormatException(
          'Invalid type for countryCode: ${countryCodeObj.runtimeType}. Expected String or null.',
        );
      }

      // Attempt to create BabelSupportedLocales using the static factory.
      final BabelSupportedLocales? locale = BabelSupportedLocales.fromLocale(
        languageCode,
        countryCode,
      );

      if (locale == null) {
        // MODIFIED: Throw exception if locale cannot be created
        throw FormatException(
          'Could not find or create BabelSupportedLocales for languageCode: "$languageCode", countryCode: "$countryCode"',
        );
      }
      return locale; // Return non-nullable locale
    }

    // MODIFIED: Throw exception if languageCode is missing or not a String
    throw FormatException(
      'Invalid or missing languageCode. Expected String, got: ${langCodeObj.runtimeType}',
    );
  }

  @override
  Map<String, dynamic> toJson(BabelSupportedLocales object) {
    // REMOVED: Null check for object, as it's now non-nullable.
    // Use the toMap method of BabelSupportedLocales for serialization.
    return object.toMap();
  }
}
