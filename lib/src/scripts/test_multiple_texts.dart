final oder = 'Order there is';
// ignore_for_file: unnecessary_string_escapes, unnecessary_brace_in_string_interps, unused_local_variable, unnecessary_string_interpolations

getStringInFile(String text) {
  final stringTest = 'My name is \"John Doe\"';
  // (?<!\\)('|").+?(?<!\\)\1
  final stringTest2 = "My name is \'John Doe\'";

  final String name = 'John Doe';
  final String a1 = 'My name is "${name}"';
  final String a2 = "My name is '${name}'";
  final String a3 = "My name is \'${name}\'";
  final String a0 = 'My name is \"${name}\"';
  final String a4 = "My name is \"${name}\"";
  final String a5 = 'My name is \'${name}\'';
  final String a7 = "My name is \"${name}\"";
  final String a9 = 'My name is \"${name}\'';

  final String b1 = 'My name is "$name"';
  final String b2 = "My name is '$name'";
  final String b3 = "My name is \'$name\'";
  final String b0 = 'My name is \"$name\"';
  final String b4 = "My name is \"$name\"";
  final String b5 = 'My name is \'$name\'';
  final String b7 = "My name is \"$name\"";
  final String b9 = 'My name is \"$name\'';

  final String c1 = 'My name is "${name.length}"';
  final String c2 = "My name is '${name.length}'";
  final String c3 = "My name is \'${name.length}\'";
  final String c0 = 'My name is \"${name.length}\"';
  final String c4 = "My name is \"${name.length}\"";
  final String c5 = 'My name is \'${name.length}\'';
  final String c7 = "My name is \"${name.length}\"";
  final String c9 = 'My name is \"${name.length}\'';

  final List<Person> persons = [
    Person(name: 'John Doe', age: 30, address: 'New York', children: [
      Children(name: 'Alice', age: 5),
      Children(name: 'Bob', age: 10),
    ]),
    Person(name: 'Jane Doe', age: 25, address: 'Los Angeles', children: [
      Children(name: 'Charlie', age: 3),
      Children(name: 'David', age: 7),
    ]),
  ];

  final String d1 = 'My name is "${persons[0].name}"';
  final String d2 = "My name is '${persons[0].address}'";

  final String personsListage1 =
      'Lets see: ${persons.map((p) => p.name).toList()}';
  final String personsListage2 =
      'Lets see:${persons.map((p) => p.address).toList()}';
  final String personsListage3 =
      'Lets see golfi:${persons.map((p) => '${p.address}').toList()}';
  final String personsListage4 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}').toList()}';
  final String personsListage5 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old').toList()}';
  final String personsListage6 =
      'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
            return e.name;
          })}').toList()}';
  final String personsListage7 = 'Lets see:\n${persons.map((p) {
    return 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) {
      return "Name: ${e.name}";
    })}';
  }).toList()}';
  // 'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) => '${e.name} with ${e.age}')}').toList()}';
}
/*
'Lets see:\n${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) => '${e.name} with ${e.age}')}').toList()}';
AiBabel.i.letSee(${persons.map((p) => 'Name: ${p.name}, im ${p.age} years old.\nChildren: ${p.children.map((e) => '${e.name} with ${e.age}')}').toList()})
AiBabel.i.letSee( '${persons.map((p) => AiBabel.i.nameYear(p.name, p.age, p.children.map((e) => '${e.name} with ${e.age}) ).toList()}')
AiBabel.i.letSee( '${persons.map((p) => AiBabel.i.nameYear(p.name, p.age, p.children.map(e) => AiBabel.nameAndAge(e.name, e.age)) ).toList()}')
*/

class Person {
  final String name;
  final int age;
  final String address;
  final List<Children> children;

  Person({
    required this.name,
    required this.age,
    required this.address,
    required this.children,
  });
}

class Children {
  final String name;
  final int age;

  Children({
    required this.name,
    required this.age,
  });
}
