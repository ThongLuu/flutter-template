import 'dart:io';

import 'package:class_generator/class_generator.dart';

void main(List<String> args) async {
  var className = "ProductCart";
  var fields = [
    Field('int', 'id'),
    Field('int', 'variantId'),
    Field('int', 'productId'),
    Field('String', 'title'),
    Field('String', 'productTitle'),
    Field('String', 'productDescription'),
    Field('String', 'sku'),
    Field('String', 'handle'),
    Field('String', 'productType'),
    Field('String', 'vendor'),
    Field('String', 'url'),
    Field('String', 'image'),
    Field('int', 'price'),
    Field('int', 'linePrice'),
    Field('int', 'priceOriginal'),
    Field('int', 'linePriceOriginal'),
    Field('int', 'quantity'),
    Field('int', 'grams'),
    Field('bool', 'giftCard'),
    Field('bool', 'requiresShipping'),
    Field('List<String>', 'variantOptions'),
    Field('List<String>', 'promotionBy'),
    Field('List<String>', 'promotionRef')
  ];

  final model = ClassBuilder(className)
    ..constructor = true
    ..copyWith = true
    ..toMap = true
    ..fromMap = true
    ..empty = true
    ..equatable = false
    ..fields.addAll(fields.map((e) => e..modifier = 'final'));

  // print(model.build());

  final filename = '${className}.dart';
  var file = await File(filename).writeAsString(model.build());
}
