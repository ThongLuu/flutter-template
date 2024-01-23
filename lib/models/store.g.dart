// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreAdapter extends TypeAdapter<Store> {
  @override
  final int typeId = 0;

  @override
  Store read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Store(
      storeObjectId: fields[0] as String,
      posId: fields[1] as int,
      posName: fields[2] as String,
      merchantId: fields[3] as String,
      fullAddress: fields[4] as String,
      address: fields[5] as String,
      ward: fields[6] as String,
      district: fields[7] as String,
      city: fields[8] as String,
      isActive: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Store obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.storeObjectId)
      ..writeByte(1)
      ..write(obj.posId)
      ..writeByte(2)
      ..write(obj.posName)
      ..writeByte(3)
      ..write(obj.merchantId)
      ..writeByte(4)
      ..write(obj.fullAddress)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.ward)
      ..writeByte(7)
      ..write(obj.district)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
