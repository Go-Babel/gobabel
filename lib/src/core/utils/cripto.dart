import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<String> generateSha1(String input) async {
  try {
    var bytes = utf8.encode(input);
    var digest = sha1.convert(bytes);
    return digest.toString().toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'SHA1 generation failed',
        description: 'Failed to generate SHA1 hash for input',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}
