class Address {
  final int? id;
  final String houseNumber;
  final String buildingName;
  final String addressLineOne;
  final String nearbyLandmark;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String urName;
  final String mobNum;
  final String addressType;
  final bool isPrimary;
  final String primarymob;
  final String emailAdd;

  Address({
    this.id,
    required this.houseNumber,
    required this.buildingName,
    required this.addressLineOne,
    required this.nearbyLandmark,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.urName,
    required this.mobNum,
    required this.addressType,
    required this.isPrimary,
    required this.primarymob,
    required this.emailAdd,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
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
      isPrimary: json['primary'] ?? false,
      primarymob: json['primarymob'],
      emailAdd: json['emailAdd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "houseNumber": houseNumber,
      "buildingName": buildingName,
      "addressLineOne": addressLineOne,
      "nearbyLandmark": nearbyLandmark,
      "city": city,
      "state": state,
      "zipCode": zipCode,
      "country": country,
      "urName": urName,
      "mobNum": mobNum,
      "addressType": addressType,
      "primary": isPrimary,
      "primarymob": primarymob,
      "emailAdd": emailAdd,
    };
  }
}
