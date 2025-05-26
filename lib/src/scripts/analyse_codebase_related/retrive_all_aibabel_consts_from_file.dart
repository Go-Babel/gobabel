import 'package:gobabel_core/gobabel_core.dart';

class RetriveAllAibabelConstsFromFile {
  // Keys of all AiBabel contants [BabelText] in file
  List<String> call(String source) {
    final List<String> resp = <String>[];

    final allMatches = _regex.allMatches(source);
    for (final match in allMatches) {
      resp.add(match.group(1)!);
    }

    return resp;
  }
}

final _regex = RegExp(kBabelClass + r'\n?\s{0,}\.\s{0,}\n?\s{0,}(\w{1,})');
