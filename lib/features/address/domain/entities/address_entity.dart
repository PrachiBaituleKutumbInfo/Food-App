// import 'package:equatable/equatable.dart';

// class AddResponseEntity extends Equatable {
//   final String responseStatus;
//   final String responseCode;
//   final String responseMessage;
//   final List<String> responseData;

//   const AddResponseEntity({
//     required this.responseStatus,
//     required this.responseCode,
//     required this.responseMessage,
//     required this.responseData,
//   });

//   @override
//   List<Object?> get props => [
//         responseStatus,
//         responseCode,
//         responseMessage,
//         responseData,
//       ];
// }

// import 'package:equatable/equatable.dart';

// class AddressEntity extends Equatable {
//   final String id;
//   final String userId;
//   final String addressLine1;
//   final String? addressLine2;
//   final String city;
//   final String state;
//   final String postalCode;
//   final String country;
//   final bool isDefault;

//   // Optional response fields, if you want to include API response info
//   final String? responseStatus;
//   final String? responseCode;
//   final String? responseMessage;

//   const AddressEntity({
//     required this.id,
//     required this.userId,
//     required this.addressLine1,
//     this.addressLine2,
//     required this.city,
//     required this.state,
//     required this.postalCode,
//     required this.country,
//     this.isDefault = false,
//     this.responseStatus,
//     this.responseCode,
//     this.responseMessage,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         userId,
//         addressLine1,
//         addressLine2,
//         city,
//         state,
//         postalCode,
//         country,
//         isDefault,
//         responseStatus,
//         responseCode,
//         responseMessage,
//       ];

//   @override
//   String toString() {
//     return 'AddressEntity(id: $id, userId: $userId, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, isDefault: $isDefault, responseStatus: $responseStatus, responseCode: $responseCode, responseMessage: $responseMessage)';
//   }
// }

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
}
