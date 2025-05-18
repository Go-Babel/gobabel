import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/get_project_yaml_config.dart';
import 'package:gobabel/src/scripts/arb_migration_related/replace_arb_output_class_to_babel_text.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:test/test.dart';

void main() {
  final ReplaceArbOutputClassToBabelTextUsecase usecase =
      ReplaceArbOutputClassToBabelTextUsecase();

  setUp(() {
    Dependencies.resetAll();
    Dependencies.arbData = _mockArbData;
  });

  test('Should replace as expected', () async {
    final newContent = usecase(
      fileName: 'dummy_file.dart',
      fileContent: _dummyInputFileContent,
    );
    expect(newContent, _dummyOutputFileContent);
  });
}

final String _dummyOutputFileContent =
    '''import 'package:flutter/material.dart';
import 'package:scoutbox/gen_l10n/s.dart';
import 'package:video_generator/video_generator.dart';

extension VideoGroupTypeExt on VideoGroupType {
  String displayName(BuildContext context) {
    return switch (this) {
      VideoGroupType.passing => BabelText.of(context)!.passing,
      VideoGroupType.duels => BabelText.of(context)!.duels,
      VideoGroupType.goalsAndAssists => BabelText.of(context)!.goals_and_assists,
      VideoGroupType.goals => BabelText.of(context)!.goals,
      VideoGroupType.assists => BabelText.of(context)!.assists,
      VideoGroupType.headShots => BabelText.of(context)!.head_shots,
      VideoGroupType.keyPassing => BabelText.of(context)!.key_passing,
      VideoGroupType.shots => BabelText.of(context)!.shots,
      VideoGroupType.sprints => BabelText.of(context)!.sprints,
      VideoGroupType.aerialChallenges => BabelText.of(context)!.aerial_challenges,
      VideoGroupType.depthControl => BabelText.of(context)!.depth_control,
      VideoGroupType.saves => BabelText.of(context)!.saves,
      VideoGroupType.defensiveActions => BabelText.of(context)!.defensive_actions,
      VideoGroupType.crossing => BabelText.of(context)!.crossing,
      VideoGroupType.offensiveActions => BabelText.of(context)!.offensive_actions,
      VideoGroupType.longPassing => BabelText.of(context)!.long_passing,
      VideoGroupType.defensiveDuels => BabelText.of(context)!.defensive_duels,
      VideoGroupType.defensiveAerials => BabelText.of(context)!.defensive_aerials,
      VideoGroupType.defensivePositioning => BabelText.of(context)!.defensive_positioning,
      VideoGroupType.ballCarry => BabelText.of(context)!.ball_carry,
    };
  }
}''';

final String _dummyInputFileContent = '''import 'package:flutter/material.dart';
import 'package:scoutbox/gen_l10n/s.dart';
import 'package:video_generator/video_generator.dart';

extension VideoGroupTypeExt on VideoGroupType {
  String displayName(BuildContext context) {
    return switch (this) {
      VideoGroupType.passing => S.of(context)!.passing,
      VideoGroupType.duels => S.of(context)!.duels,
      VideoGroupType.goalsAndAssists => S.of(context)!.goals_and_assists,
      VideoGroupType.goals => S.of(context)!.goals,
      VideoGroupType.assists => S.of(context)!.assists,
      VideoGroupType.headShots => S.of(context)!.head_shots,
      VideoGroupType.keyPassing => S.of(context)!.key_passing,
      VideoGroupType.shots => S.of(context)!.shots,
      VideoGroupType.sprints => S.of(context)!.sprints,
      VideoGroupType.aerialChallenges => S.of(context)!.aerial_challenges,
      VideoGroupType.depthControl => S.of(context)!.depth_control,
      VideoGroupType.saves => S.of(context)!.saves,
      VideoGroupType.defensiveActions => S.of(context)!.defensive_actions,
      VideoGroupType.crossing => S.of(context)!.crossing,
      VideoGroupType.offensiveActions => S.of(context)!.offensive_actions,
      VideoGroupType.longPassing => S.of(context)!.long_passing,
      VideoGroupType.defensiveDuels => S.of(context)!.defensive_duels,
      VideoGroupType.defensiveAerials => S.of(context)!.defensive_aerials,
      VideoGroupType.defensivePositioning => S.of(context)!.defensive_positioning,
      VideoGroupType.ballCarry => S.of(context)!.ball_carry,
    };
  }
}''';

final _mockArbData = ArbData(
  config: _arbConfig,
  // mainPreMadeTranslationArb: _mockArbFileData,
  preMadeTranslationArb: [_mockArbFileData],
  allDeclarationFunctions: {
    'passing': '',
    'duels': '',
    'goals_and_assists': '',
    'goals': '',
    'assists': '',
    'head_shots': '',
    'key_passing': '',
    'shots': '',
    'sprints': '',
    'aerial_challenges': '',
    'depth_control': '',
    'saves': '',
    'defensive_actions': '',
    'crossing': '',
    'offensive_actions': '',
    'long_passing': '',
    'defensive_duels': '',
    'defensive_aerials': '',
    'defensive_positioning': '',
    'ball_carry': '',
  },
);

final _mockArbFileData = ArbFileData(
  locale: BabelSupportedLocales.enUS,
  allKeyValues: {},
);

final _arbConfig = L10nProjectConfig(
  l10nFileName: 'l10n.yaml',
  arbDir: 'lib/l10n',
  outputDir: 'lib/l10n',
  templateArbFile: 'app_en.arb',
  outputClass: 'S',
);
