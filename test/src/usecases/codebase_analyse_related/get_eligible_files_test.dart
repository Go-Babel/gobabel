import 'dart:io';

import 'package:gobabel/src/usecases/codebase_analyse_related/get_eligible_files.dart';
import 'package:test/test.dart';

void main() {
  test('should get loading_builder.dart', () async {
    final result = await getEligibleFiles(
      Directory('/Users/igormidev/gobabel/scoutbox-app/'),
    );
    expect(result.isSuccess(), isTrue);
    print(result.getOrThrow().map((e) => e.path).join('"\n"'));
    final referenceComparison =
        '/Users/igormidev/gobabel/scoutbox-app/lib/elements/loading_builder.dart';
    expect(
      result
          .getOrThrow()
          .map((e) => e.path)
          .any(
            (element) =>
                element == referenceComparison ||
                element.endsWith('loading_builder.dart'),
          ),
      isTrue,
    );
  });
}
