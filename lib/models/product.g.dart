// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      title: fields[1] as String,
      sku: fields[2] as String,
      handle: fields[3] as String,
      lastSyncSuccess: fields[4] as int,
      productType: fields[5] as String,
      published: fields[6] as bool,
      vendor: fields[7] as String,
      tags: fields[8] as String?,
      options: (fields[10] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          ?.toList(),
      image: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.sku)
      ..writeByte(3)
      ..write(obj.handle)
      ..writeByte(4)
      ..write(obj.lastSyncSuccess)
      ..writeByte(5)
      ..write(obj.productType)
      ..writeByte(6)
      ..write(obj.published)
      ..writeByte(7)
      ..write(obj.vendor)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.options)
      ..writeByte(12)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
