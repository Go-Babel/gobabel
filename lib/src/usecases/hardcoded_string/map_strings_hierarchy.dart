import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_dynamic_value_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/labels_entity.dart';
import 'package:gobabel/src/usecases/hardcoded_string/create_human_friendly_arb_keys.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<List<LabelsEntityRootLabel>> mapStringsHierarchy({
  required List<HumanFriendlyArbKeyResponse> strings,
}) async {
  // First, separate root strings (those without parent) from child strings
  final rootStrings =
      strings
          .where(
            (e) =>
                e.value.parentStartIndex == null &&
                e.value.parentEndIndex == null,
          )
          .toList();
  final childStrings =
      strings
          .where(
            (e) =>
                e.value.parentStartIndex != null &&
                e.value.parentEndIndex != null,
          )
          .toList();

  // Create root labels from root strings
  final rootLabels =
      rootStrings.map((rootEntry) {
        // Find children for this root string
        final children = _buildChildren(
          rootEntry.value,
          childStrings,
          rootEntry.value.dynamicFields,
          strings,
        );

        // Create a root label with its children
        return LabelsEntity.rootLabel(
              l10nKey: rootEntry.key, // TranslationKey
              hardcodedString: rootEntry.value.value, // Original string value
              fileStartIndex: rootEntry.value.fileStartIndex,
              fileEndIndex: rootEntry.value.fileEndIndex,
              filePath:
                  rootEntry.value.filePath, // FilePath is a typedef for String
              children: children,
            )
            as LabelsEntityRootLabel;
      }).toList();

  return rootLabels.toSuccess();
}

// Build children for a parent string (either root or child)
List<LabelsEntity> _buildChildren(
  HardcodedStringEntity parent,
  List<HumanFriendlyArbKeyResponse> allChildStrings,
  List<HardcodedStringDynamicValue> dynamicValues,
  // Map<TranslationKey, HardcodedStringEntity> strings,
  List<HumanFriendlyArbKeyResponse> strings,
) {
  final List<LabelsEntity> children = [];

  // Find child strings that are inside this parent's range
  final directChildStrings =
      allChildStrings.where((entry) {
        return entry.value.parentStartIndex != null &&
            entry.value.parentEndIndex != null &&
            entry.value.parentStartIndex! >= parent.fileStartIndex &&
            entry.value.parentEndIndex! <= parent.fileEndIndex &&
            entry.value.filePath == parent.filePath; // Must be from same file
      }).toList();

  // Create child labels for each direct child string
  for (final childEntry in directChildStrings) {
    // Find children for this child string
    final grandchildren = _buildChildren(
      childEntry.value,
      allChildStrings,
      childEntry.value.dynamicFields,
      strings,
    );

    children.add(
      LabelsEntity.childLabel(
        l10nKey: childEntry.key, // TranslationKey
        hardcodedString: childEntry.value.value, // Original string value
        parentStartIndex: childEntry.value.parentStartIndex!,
        parentEndIndex: childEntry.value.parentEndIndex!,
        children: grandchildren,
      ),
    );
  }

  // Add dynamic values as children
  for (final dynamicValue in dynamicValues) {
    // Find any child strings that are inside this dynamic value's range
    final dynamicValueChildren = _buildDynamicValueChildren(
      dynamicValue,
      allChildStrings,
      parent.filePath,
    );

    children.add(
      LabelsEntity.labelDynamicValue(
        content: dynamicValue.value,
        parentStartIndex: dynamicValue.parentStartIndex,
        parentEndIndex: dynamicValue.parentEndIndex,
        children: dynamicValueChildren,
      ),
    );
  }

  // Sort children by parentStartIndex
  children.sort((a, b) {
    int aIndex = 0;
    int bIndex = 0;

    if (a is LabelsEntityChildLabel) {
      aIndex = a.parentStartIndex;
    } else if (a is LabelsEntityLabelDynamicValue) {
      aIndex = a.parentStartIndex;
    }

    if (b is LabelsEntityChildLabel) {
      bIndex = b.parentStartIndex;
    } else if (b is LabelsEntityLabelDynamicValue) {
      bIndex = b.parentStartIndex;
    }

    return aIndex.compareTo(bIndex);
  });

  return children;
}

// Build children for a dynamic value
List<LabelsEntity> _buildDynamicValueChildren(
  HardcodedStringDynamicValue dynamicValue,
  List<HumanFriendlyArbKeyResponse> allChildStrings,
  String parentFilePath,
) {
  final List<LabelsEntity> children = [];

  // Find child strings that are inside this dynamic value's range
  final directChildStrings =
      allChildStrings.where((entry) {
        return entry.value.parentStartIndex != null &&
            entry.value.parentEndIndex != null &&
            entry.value.parentStartIndex! >= dynamicValue.fileStartIndex &&
            entry.value.parentEndIndex! <= dynamicValue.fileEndIndex &&
            entry.value.filePath ==
                parentFilePath; // Must be from same file as parent
      }).toList();

  // Create child labels for each direct child string
  for (final childEntry in directChildStrings) {
    // Find children for this child string
    final grandchildren = _buildChildren(
      childEntry.value,
      allChildStrings,
      childEntry.value.dynamicFields,
      allChildStrings,
      // allChildStrings.fold(
      //   {},
      //   (map, entry) => map..[entry.key] = entry.value,
      // ),
    );

    children.add(
      LabelsEntity.childLabel(
        l10nKey: childEntry.key, // TranslationKey
        hardcodedString: childEntry.value.value, // Original string value
        parentStartIndex: childEntry.value.parentStartIndex!,
        parentEndIndex: childEntry.value.parentEndIndex!,
        children: grandchildren,
      ),
    );
  }

  // Sort children by parentStartIndex
  children.sort((a, b) {
    int aIndex = 0;
    int bIndex = 0;

    if (a is LabelsEntityChildLabel) {
      aIndex = a.parentStartIndex;
    } else if (a is LabelsEntityLabelDynamicValue) {
      aIndex = a.parentStartIndex;
    }

    if (b is LabelsEntityChildLabel) {
      bIndex = b.parentStartIndex;
    } else if (b is LabelsEntityLabelDynamicValue) {
      bIndex = b.parentStartIndex;
    }

    return aIndex.compareTo(bIndex);
  });

  return children;
}

AsyncBabelResult<GenerateFlowMappedStringsHierarchy>
generate_mapStringsHierarchy(
  GenerateFlowCreatedHumanFriendlyArbKeys payload,
) async {
  final labelEntitiesResult = await mapStringsHierarchy(
    strings: payload.humanFriendlyResponse.humanFriendlyArbKeys,
  );

  if (labelEntitiesResult.isError()) {
    return labelEntitiesResult.asBabelResultErrorAsync();
  }

  final labelEntities = labelEntitiesResult.getOrThrow();

  return GenerateFlowMappedStringsHierarchy(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
    dangerouslyAutoDetectUserFacingHardcodedStrings:
        payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
    runForAllFiles: payload.runForAllFiles,
    client: payload.client,
    yamlInfo: payload.yamlInfo,
    gitVariables: payload.gitVariables,
    maxLanguageCount: payload.maxLanguageCount,
    languages: payload.languages,
    projectCacheMap: payload.projectCacheMap,
    cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
    filesVerificationState: payload.filesVerificationState,
    projectArbData: payload.projectArbData,
    remapedArbKeys: payload.remapedArbKeys,
    codebaseArbTranslationPayloadInfo:
        payload.codebaseArbTranslationPayloadInfo,
    allExtractedStrings: payload.allExtractedStrings,
    sessionUuid: payload.sessionUuid,
    fieldsToBeAnalysed: payload.fieldsToBeAnalysed,
    labelStrings: payload.labelStrings,
    humanFriendlyResponse: payload.humanFriendlyResponse,
    labelEntities: labelEntities,
  ).toSuccess();
}
