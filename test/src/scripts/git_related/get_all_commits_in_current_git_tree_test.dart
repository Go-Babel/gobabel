import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/git_related/get_all_commits_in_current_git_tree_time_sorted.dart';
import 'package:test/test.dart';

void main() {
  test('get all commits in current git tree ...', () async {
    final getAllCommitsInCurrentGitTree =
        GetAllCommitsInCurrentGitTreeOrdoredByTime();
    final result = await getAllCommitsInCurrentGitTree.call();
    expect(result, isNotEmpty);
    expect(result, isA<List<String>>());
    expect(result.take(7), _expectedShas);
  });
}

final List<ShaCommit> _expectedShas = [
  "62c704a19aef84febda0c7cc2b42e715171b0001",
  "f83bd7a085c2814050343742aa88c2c87549f8af",
  "63daa6a64efff2e9b6b444cb835d2e67249ec7d4",
  "3418f6a0f17f23726f78b01214f8b3455b8c3855",
  "7680d190ae71011b780a1572b554eb1a1f5bd3dc",
  "e2d6d5985c3776a3a537aa5edcae15793a50e763",
  "727756246aa98bade13a7f9c9cec714be4e7acfe",
];
