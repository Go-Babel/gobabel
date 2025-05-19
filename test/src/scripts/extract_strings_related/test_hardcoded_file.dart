// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, depend_on_referenced_packages
import 'package:flutter/material.dart';

class TestHardcodedFile extends StatelessWidget {
  final String userName;
  final UserData userData;
  const TestHardcodedFile({
    super.key,
    required this.userName,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello, $userName!')),
      body: ListView(
        children: [
          Text(' /* top */'),
          Text(' /* top */'),
          Text('''
/*
top 
*/
'''),
          SizedBox.expand(
            child: Image.network(
              'https://lottie.host/b70b435a-8472-4e19-ad03-71579dd08074/zOcB4gAPwC.lottie',

              fit: BoxFit.fitWidth,
            ),
          ),
          for (final workSpace in userData.workspaces)
            ListTile(
              title: Text(
                workSpace.name +
                    'Total members summary: ${workSpace.members.join('')}',
              ),
              subtitle: Text(
                'Privacy: ${workSpace.isPrivate ? 'Private' : 'Public'}',
              ),
              trailing: Text(
                'Workspaces: ${userData.workspaces.map((workspace) {
                  return 'The workspace ${workspace.name} have ${workspace.members.length} members. Those are: ${workspace.members.asMap().map((index, name) => MapEntry(key, 'Num $index at name $name')).values.join(', ')}';
                })}',
              ),
            ),
        ],
      ),
    );
  }
}

class UserData {
  final List<WorkSpace> workspaces;
  const UserData({required this.workspaces});
}

class WorkSpace {
  final String name;
  final bool isPrivate;
  final List<WorkSpaceMember> members;
  const WorkSpace({
    required this.name,
    required this.members,
    required this.isPrivate,
  });
}

class WorkSpaceMember {
  final String name;
  const WorkSpaceMember({required this.name});
}
