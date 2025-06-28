import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

Result<String> generateSha1(String input) {
  try {
    var bytes = utf8.encode(input);
    var digest = sha1.convert(bytes);
    return Success(digest.toString());
  } catch (e) {
    return BabelException(
      title: 'SHA1 generation failed',
      description: 'Failed to generate SHA1 hash for input. Error: ${e.toString()}',
    ).toFailure();
  }
}
