import 'package:collection/collection.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';

class EnsureIntegrityOfArbUsecase {
  void call(ArbData arbData) {
    final BabelSupportedLocales inputedByUserLocale =
        Dependencies.referenceLanguage;

    ArbFileData? referenceArbFileData = arbData.preMadeTranslationArb
        .firstWhereOrNull(
          (ArbFileData element) =>
              element.locale.languageCode == inputedByUserLocale.languageCode &&
              element.locale.countryCode == inputedByUserLocale.countryCode,
        );

    if (referenceArbFileData == null) {
      throw BabelException(
        title:
            'No arb file found for the reference language $inputedByUserLocale',
        description:
            'The reference language used as parameter does not have a corresponding ARB file in the project. For that reason, it can not be the reference language for the project.',
      );
    }

    // Let's ensure the reference language contains all the keys
    final refKeys = referenceArbFileData.allKeyValues.keys;
    final othersArbFiles = arbData.preMadeTranslationArb.where(
      (ArbFileData element) => element.locale != referenceArbFileData.locale,
    );
    // bool hasMissingKeys = false;
    List<String> missingKeysList = [];
    for (final ArbFileData arbFile in othersArbFiles) {
      final missingKeys = refKeys.toSet().difference(
        arbFile.allKeyValues.keys.toSet(),
      );
      if (missingKeys.isNotEmpty) {
        missingKeysList.addAll(missingKeys);
      }
    }

    if (missingKeysList.isNotEmpty) {
      throw BabelException(
        title: 'Missing keys in reference ARB file',
        description:
            'The reference ARB file in the same you used as --language.\nIn this case: "$inputedByUserLocale"\nThat reference file should contain all keys since it will be use as guide lines to translate the other arb files.\n\nThe following keys are missing in the reference ARB file of the project:\n${missingKeysList.join(',\n')}.\nPlease ensure all ARB files contain the same keys as the reference language.',
      );
    }

    Dependencies.newLabelsKeys.addAll(referenceArbFileData.allKeyValues);
  }
}
