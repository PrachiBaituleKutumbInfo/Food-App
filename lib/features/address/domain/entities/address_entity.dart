class AddressEntity {
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

  AddressEntity({
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

  String get fullAddress =>
      "$houseNumber, $buildingName, $addressLineOne, $nearbyLandmark, $city, $state, $zipCode";
}
