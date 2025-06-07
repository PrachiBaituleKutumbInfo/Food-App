// import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';

// import 'package:equatable/equatable.dart';

// abstract class AddressState extends Equatable {
//   const AddressState();

//   @override
//   List<Object?> get props => [];
// }

// class AddressInitial extends AddressState {}

// class AddressLoading extends AddressState {}

// class AddressLoaded extends AddressState {
//   final AddressEntity addresses;

//   const AddressLoaded(this.addresses);

//   @override
//   List<Object?> get props => [addresses];
// }

// class AddressOperationSuccess extends AddressState {
//   const AddressOperationSuccess();

//   @override
//   List<Object?> get props => [];
// }

// class AddressError extends AddressState {
//   final String message;

//   const AddressError(this.message);

//   @override
//   List<Object?> get props => [message];
// }


import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<Address> addresses;

  AddressLoaded(this.addresses);
}

class AddressError extends AddressState {
  final String message;

  AddressError(this.message);
}