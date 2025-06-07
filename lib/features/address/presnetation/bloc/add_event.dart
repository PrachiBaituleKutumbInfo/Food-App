

// import 'package:equatable/equatable.dart';
// import '../../domain/entities/address_entity.dart';

// abstract class AddressEvent extends Equatable {
//   const AddressEvent();

//   @override
//   List<Object?> get props => [];
// }

// class FetchAddressesEvent extends AddressEvent {
//   const FetchAddressesEvent(); // ✅ No parameters

//   @override
//   List<Object?> get props => [];
// }

// class AddAddressEvent extends AddressEvent {
//   final AddressEntity address;

//   const AddAddressEvent(this.address);

//   @override
//   List<Object?> get props => [address];
// }

// class UpdateAddressEvent extends AddressEvent {
//   final AddressEntity address;

//   const UpdateAddressEvent(this.address);

//   @override
//   List<Object?> get props => [address];
// }

// class DeleteAddressEvent extends AddressEvent {
//   final String addressId;

//   const DeleteAddressEvent(this.addressId);

//   @override
//   List<Object?> get props => [addressId];
// }


import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

abstract class AddressEvent {}

class LoadAddress extends AddressEvent {}

class FetchAddresses extends AddressEvent {}

class AddAddress extends AddressEvent {
  final Address address;

  AddAddress(this.address);
}