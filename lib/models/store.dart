import 'dart:convert';

import 'package:hive/hive.dart';

part 'store.g.dart';

@HiveType(typeId: 0)
class Store {
  @HiveField(0)
  final String storeObjectId;
  @HiveField(1)
  final int posId;
  @HiveField(2)
  final String posName;
  @HiveField(3)
  final String merchantId;
  @HiveField(4)
  final String fullAddress;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final String ward;
  @HiveField(7)
  final String district;
  @HiveField(8)
  final String city;
  @HiveField(9)
  final bool isActive;

  Store({
    required this.storeObjectId,
    required this.posId,
    required this.posName,
    required this.merchantId,
    required this.fullAddress,
    required this.address,
    required this.ward,
    required this.district,
    required this.city,
    required this.isActive,
  });

  Store copyWith({
    String? storeObjectId,
    int? posId,
    String? posName,
    String? merchantId,
    String? fullAddress,
    String? address,
    String? ward,
    String? district,
    String? city,
    bool? isActive,
  }) {
    return Store(
      storeObjectId: storeObjectId ?? this.storeObjectId,
      posId: posId ?? this.posId,
      posName: posName ?? this.posName,
      merchantId: merchantId ?? this.merchantId,
      fullAddress: fullAddress ?? this.fullAddress,
      address: address ?? this.address,
      ward: ward ?? this.ward,
      district: district ?? this.district,
      city: city ?? this.city,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'storeObjectId': storeObjectId,
      'posId': posId,
      'posName': posName,
      'merchantId': merchantId,
      'fullAddress': fullAddress,
      'address': address,
      'ward': ward,
      'district': district,
      'city': city,
      'isActive': isActive,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      storeObjectId: map['storeObjectId'],
      posId: map['posId'],
      posName: map['posName'],
      merchantId: map['merchantId'],
      fullAddress: map['fullAddress'],
      address: map['address'],
      ward: map['ward'],
      district: map['district'],
      city: map['city'],
      isActive: map['isActive'],
    );
  }

  factory Store.fromJsonApi(Map<String, dynamic> map) {
    return Store(
      storeObjectId: map['_id'],
      posId: map['store_id'],
      posName: map['store_name'],
      merchantId: map['merchant_id'],
      fullAddress: map['full_address'],
      address: map['address'],
      ward: map['ward'],
      district: map['district'],
      city: map['city'],
      isActive: map['is_active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) => Store.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Store(storeObjectId: $storeObjectId, posId: $posId, posName: $posName, merchantId: $merchantId, fullAddress: $fullAddress, address: $address, ward: $ward, district: $district, city: $city, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Store &&
        other.storeObjectId == storeObjectId &&
        other.posId == posId &&
        other.posName == posName &&
        other.merchantId == merchantId &&
        other.fullAddress == fullAddress &&
        other.address == address &&
        other.ward == ward &&
        other.district == district &&
        other.city == city &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return storeObjectId.hashCode ^
        posId.hashCode ^
        posName.hashCode ^
        merchantId.hashCode ^
        fullAddress.hashCode ^
        address.hashCode ^
        ward.hashCode ^
        district.hashCode ^
        city.hashCode ^
        isActive.hashCode;
  }
}
