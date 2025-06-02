import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';

class AddressModel {
  final int? id;
  final String? houseNumber;
  final String? buildingName;
  final String? addressLineOne;
  final String? nearbyLandmark;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;
  final String? urName;
  final String? mobNum;
  final String? addressType;
  final String? storedate;
  final int? userId;
  final String? primarymob;
  final String? emailAdd;
  final bool? isPrimary;

  AddressModel({
    this.id,
    this.houseNumber,
    this.buildingName,
    this.addressLineOne,
    this.nearbyLandmark,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.urName,
    this.mobNum,
    this.addressType,
    this.storedate,
    this.userId,
    this.primarymob,
    this.emailAdd,
    this.isPrimary,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      houseNumber: json['houseNumber'],
      buildingName: json['buildingName'],
      addressLineOne: json['addressLineOne'],
      nearbyLandmark: json['nearbyLandmark'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      country: json['country'],
      urName: json['urName'],
      mobNum: json['mobNum'],
      addressType: json['addressType'],
      storedate: json['storedate'],
      userId: json['userId'],
      primarymob: json['primarymob'],
      emailAdd: json['emailAdd'],
      isPrimary: json['isPrimary'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'houseNumber': houseNumber,
        'buildingName': buildingName,
        'addressLineOne': addressLineOne,
        'nearbyLandmark': nearbyLandmark,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'country': country,
        'urName': urName,
        'mobNum': mobNum,
        'addressType': addressType,
        'storedate': storedate,
        'userId': userId,
        'primarymob': primarymob,
        'emailAdd': emailAdd,
        'isPrimary': isPrimary,
      };

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      id: entity.id,
      houseNumber: entity.houseNumber,
      buildingName: entity.buildingName,
      addressLineOne: entity.addressLineOne,
      nearbyLandmark: entity.nearbyLandmark,
      city: entity.city,
      state: entity.state,
      zipCode: entity.zipCode,
      country: entity.country,
      urName: entity.urName,
      mobNum: entity.mobNum,
      addressType: entity.addressType,
      storedate: entity.storedate,
      userId: entity.userId,
      primarymob: entity.primarymob,
      emailAdd: entity.emailAdd,
      isPrimary: entity.isPrimary,
    );
  }

  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      houseNumber: houseNumber,
      buildingName: buildingName,
      addressLineOne: addressLineOne,
      nearbyLandmark: nearbyLandmark,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
      urName: urName,
      mobNum: mobNum,
      addressType: addressType,
      storedate: storedate,
      userId: userId,
      primarymob: primarymob,
      emailAdd: emailAdd,
      isPrimary: isPrimary,
    );
  }
}
