// class AddressResponseModel {
//   String? responseStatus;
//   String? responseCode;
//   String? responseMessage;
//   ResponseData? responseData;

//   AddressResponseModel(
//       {this.responseStatus,
//       this.responseCode,
//       this.responseMessage,
//       this.responseData});

//   AddressResponseModel.fromJson(Map<String, dynamic> json) {
//     responseStatus = json['responseStatus'];
//     responseCode = json['responseCode'];
//     responseMessage = json['responseMessage'];
//     responseData = json['responseData'] != null
//         ? new ResponseData.fromJson(json['responseData'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['responseStatus'] = this.responseStatus;
//     data['responseCode'] = this.responseCode;
//     data['responseMessage'] = this.responseMessage;
//     if (this.responseData != null) {
//       data['responseData'] = this.responseData!.toJson();
//     }
//     return data;
//   }
// }

// class ResponseData {
//   Null? oTHER;
//   Null? oFFICE;
//   HOME? hOME;

//   ResponseData({this.oTHER, this.oFFICE, this.hOME});

//   ResponseData.fromJson(Map<String, dynamic> json) {
//     oTHER = json['OTHER'];
//     oFFICE = json['OFFICE'];
//     hOME = json['HOME'] != null ? new HOME.fromJson(json['HOME']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['OTHER'] = this.oTHER;
//     data['OFFICE'] = this.oFFICE;
//     if (this.hOME != null) {
//       data['HOME'] = this.hOME!.toJson();
//     }
//     return data;
//   }
// }

// class HOME {
//   int? id;
//   String? houseNumber;
//   String? buildingName;
//   String? addressLineOne;
//   String? nearbyLandmark;
//   String? city;
//   String? state;
//   String? zipCode;
//   String? country;
//   String? urName;
//   String? mobNum;
//   String? addressType;
//   String? storedate;
//   int? userId;
//   String? primarymob;
//   String? emailAdd;
//   bool? primary;

//   HOME(
//       {this.id,
//       this.houseNumber,
//       this.buildingName,
//       this.addressLineOne,
//       this.nearbyLandmark,
//       this.city,
//       this.state,
//       this.zipCode,
//       this.country,
//       this.urName,
//       this.mobNum,
//       this.addressType,
//       this.storedate,
//       this.userId,
//       this.primarymob,
//       this.emailAdd,
//       this.primary});

//   HOME.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     houseNumber = json['houseNumber'];
//     buildingName = json['buildingName'];
//     addressLineOne = json['addressLineOne'];
//     nearbyLandmark = json['nearbyLandmark'];
//     city = json['city'];
//     state = json['state'];
//     zipCode = json['zipCode'];
//     country = json['country'];
//     urName = json['urName'];
//     mobNum = json['mobNum'];
//     addressType = json['addressType'];
//     storedate = json['storedate'];
//     userId = json['userId'];
//     primarymob = json['primarymob'];
//     emailAdd = json['emailAdd'];
//     primary = json['primary'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['houseNumber'] = this.houseNumber;
//     data['buildingName'] = this.buildingName;
//     data['addressLineOne'] = this.addressLineOne;
//     data['nearbyLandmark'] = this.nearbyLandmark;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['zipCode'] = this.zipCode;
//     data['country'] = this.country;
//     data['urName'] = this.urName;
//     data['mobNum'] = this.mobNum;
//     data['addressType'] = this.addressType;
//     data['storedate'] = this.storedate;
//     data['userId'] = this.userId;
//     data['primarymob'] = this.primarymob;
//     data['emailAdd'] = this.emailAdd;
//     data['primary'] = this.primary;
//     return data;
//   }
// }


// class UserAddressResponse {
//   final String responseStatus;
//   final String responseCode;
//   final String responseMessage;
//   final AddressResponseData responseData;

//   UserAddressResponse({
//     required this.responseStatus,
//     required this.responseCode,
//     required this.responseMessage,
//     required this.responseData,
//   });

//   factory UserAddressResponse.fromJson(Map<String, dynamic> json) {
//     return UserAddressResponse(
//       responseStatus: json['responseStatus'] as String,
//       responseCode: json['responseCode'] as String,
//       responseMessage: json['responseMessage'] as String,
//       responseData: AddressResponseData.fromJson(json['responseData']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'responseStatus': responseStatus,
//         'responseCode': responseCode,
//         'responseMessage': responseMessage,
//         'responseData': responseData.toJson(),
//       };
// }

// class AddressResponseData {
//   final AddressModel? home;
//   final AddressModel? office;
//   final AddressModel? other;

//   AddressResponseData({
//     this.home,
//     this.office,
//     this.other,
//   });

//   factory AddressResponseData.fromJson(Map<String, dynamic> json) {
//     return AddressResponseData(
//       home: json['HOME'] != null ? AddressModel.fromJson(json['HOME']) : null,
//       office: json['OFFICE'] != null ? AddressModel.fromJson(json['OFFICE']) : null,
//       other: json['OTHER'] != null ? AddressModel.fromJson(json['OTHER']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'HOME': home?.toJson(),
//         'OFFICE': office?.toJson(),
//         'OTHER': other?.toJson(),
//       };

//   /// 👇 Add this utility method to fetch address by type
//   AddressModel? getAddressByType(String type) {
//     switch (type.toUpperCase()) {
//       case 'HOME':
//         return home;
//       case 'OFFICE':
//         return office;
//       case 'OTHER':
//         return other;
//       default:
//         return null;
//     }
//   }
// }

// class AddressModel {
//   final int id;
//   final String houseNumber;
//   final String buildingName;
//   final String addressLineOne;
//   final String nearbyLandmark;
//   final String city;
//   final String state;
//   final String zipCode;
//   final String country;
//   final String urName;
//   final String mobNum;
//   final String addressType;
//   final String storedate;
//   final int userId;
//   final String primarymob;
//   final String emailAdd;
//   final bool primary;

//   AddressModel({
//     required this.id,
//     required this.houseNumber,
//     required this.buildingName,
//     required this.addressLineOne,
//     required this.nearbyLandmark,
//     required this.city,
//     required this.state,
//     required this.zipCode,
//     required this.country,
//     required this.urName,
//     required this.mobNum,
//     required this.addressType,
//     required this.storedate,
//     required this.userId,
//     required this.primarymob,
//     required this.emailAdd,
//     required this.primary,
//   });

//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       id: json['id'],
//       houseNumber: json['houseNumber'],
//       buildingName: json['buildingName'],
//       addressLineOne: json['addressLineOne'],
//       nearbyLandmark: json['nearbyLandmark'],
//       city: json['city'],
//       state: json['state'],
//       zipCode: json['zipCode'],
//       country: json['country'],
//       urName: json['urName'],
//       mobNum: json['mobNum'],
//       addressType: json['addressType'],
//       storedate: json['storedate'],
//       userId: json['userId'],
//       primarymob: json['primarymob'],
//       emailAdd: json['emailAdd'],
//       primary: json['primary'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'houseNumber': houseNumber,
//         'buildingName': buildingName,
//         'addressLineOne': addressLineOne,
//         'nearbyLandmark': nearbyLandmark,
//         'city': city,
//         'state': state,
//         'zipCode': zipCode,
//         'country': country,
//         'urName': urName,
//         'mobNum': mobNum,
//         'addressType': addressType,
//         'storedate': storedate,
//         'userId': userId,
//         'primarymob': primarymob,
//         'emailAdd': emailAdd,
//         'primary': primary,
//       };
// }


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