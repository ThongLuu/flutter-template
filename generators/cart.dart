import 'dart:io';

import 'package:class_generator/class_generator.dart';

void main(List<String> args) async {
  var fields = [
    Field('String', 'token'),
    Field('int', 'itemCount'),
    Field('int', 'totalPrice'),
    Field('int', 'totalWeight'),
    Field('bool', 'requiresShipping'),
    Field('List<Product>', 'items'),
    Field('String?', 'note'),
    Field('int?', 'locationId'),
    Field('int?', 'customerId'),
  ];

  final model = ClassBuilder('Cart')
    ..constructor = true
    ..copyWith = true
    ..toMap = true
    ..fromMap = true
    ..empty = true
    ..equatable = false
    ..fields.addAll(fields.map((e) => e..modifier = 'final'));

  // print(model.build());

  final filename = 'Human.dart';
  var file = await File(filename).writeAsString(model.build());
}
