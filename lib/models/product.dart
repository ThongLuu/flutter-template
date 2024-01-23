import 'dart:convert';

import 'package:get/utils.dart';
import 'package:flutter_template/configs/app_const.dart';
import 'package:flutter_template/utils/logging/logger.dart';

import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String sku;
  @HiveField(3)
  final String handle;
  @HiveField(4)
  final int lastSyncSuccess;
  @HiveField(5)
  final String productType;
  @HiveField(6)
  final bool published;
  @HiveField(7)
  final String vendor;
  @HiveField(8)
  final String? tags;
  @HiveField(10)
  final List<Map<String, dynamic>>? options;
  @HiveField(12)
  final String? image;

  Product({
    required this.id,
    required this.title,
    required this.sku,
    required this.handle,
    required this.lastSyncSuccess,
    required this.productType,
    required this.published,
    required this.vendor,
    this.tags,
    this.options,
    this.image,
  });

  Product copyWith({
    int? id,
    String? title,
    String? sku,
    String? handle,
    int? lastSyncSuccess,
    String? productType,
    bool? published,
    String? vendor,
    String? tags,
    List<Map<String, dynamic>>? options,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      sku: sku ?? this.sku,
      handle: handle ?? this.handle,
      lastSyncSuccess: lastSyncSuccess ?? this.lastSyncSuccess,
      productType: productType ?? this.productType,
      published: published ?? this.published,
      vendor: vendor ?? this.vendor,
      tags: tags ?? this.tags,
      options: options ?? this.options,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sku': sku,
      'handle': handle,
      'lastSyncSuccess': lastSyncSuccess,
      'productType': productType,
      'published': published,
      'vendor': vendor,
      'tags': tags,
      'options': options,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      sku: map['sku'],
      handle: map['handle'],
      lastSyncSuccess: map['lastSyncSuccess'],
      productType: map['productType'],
      published: map['published'],
      vendor: map['vendor'],
      tags: map['tags'],
      image: map['image'],
      options: List<Map<String, dynamic>>.from(map['options']?.map((x) {
        return {
          "name": x['name'],
          "position": x['position'],
        };
      })),
    );
  }

  factory Product.fromJsonApi(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        title: map['title'],
        sku: map['sku'] ?? "",
        handle: map['handle'],
        lastSyncSuccess: map['last_sync_success_at_timestamp'],
        productType: map['product_type'],
        published: map['published'],
        vendor: map['vendor'],
        tags: map['tags'],
        options: List<Map<String, dynamic>>.from(map['options']?.map((x) {
          return {
            "name": x['name'],
            "position": x['position'],
          };
        })),
        image: map['images']?.length == 0
            ? AppConst().ProductNoImageURL
            : map['images']?.toList().first['src']);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, sku: $sku, handle: $handle, lastSyncSuccess: $lastSyncSuccess, productType: $productType, published: $published, vendor: $vendor, tags: $tags, options: ${options?.map((e) => e.toString())},  image: ${image})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.sku == sku &&
        other.handle == handle &&
        other.lastSyncSuccess == lastSyncSuccess &&
        other.productType == productType &&
        other.published == published &&
        other.vendor == vendor &&
        other.tags == tags &&
        other.options == options &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        sku.hashCode ^
        handle.hashCode ^
        lastSyncSuccess.hashCode ^
        productType.hashCode ^
        published.hashCode ^
        vendor.hashCode ^
        tags.hashCode ^
        options.hashCode ^
        image.hashCode;
  }
}
