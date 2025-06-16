import 'package:gobabel/src/usecases/codebase_analyse_related/resolve_null_assert_static_analysis_errors.dart';
import 'package:test/test.dart';

void main() {
  group('ResolveNullAssertStaticAnalysisErrors', () {
    test('real file example', () {
      const fileContent = """import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  required void Function()? onConfirm,
  String? confirmButtonText,
}) async {
  confirmButtonText ??= 'Confirm';

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: message != null ? BabelText(message) : null,
        actions: [
          TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop();
            },
            child: Text(confirmButtonText), // Here is the null assert error
          ),
        ],
      );
    },
  );
}
""";

      final expected = """import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  required void Function()? onConfirm,
  String? confirmButtonText,
}) async {
  confirmButtonText ??= 'Confirm';

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: message != null ? BabelText(message!) : null,
        actions: [
          TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop();
            },
            child: Text(confirmButtonText!), // Here is the null assert error
          ),
        ],
      );
    },
  );
}
""";
      expect(
        singleResolveNullAssertStaticAnalysisErrorsForStrings(fileContent),
        expected,
      );
    });
  });
}
