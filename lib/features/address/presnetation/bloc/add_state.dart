// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// import 'package:meta/meta.dart';

// @immutable
// sealed class AddressState{}


// /// Initial state when the authentication process has not started.
// final class AddressInitialState extends AddressState {}

// /// State when authentication is in progress.
// final class AddressLoadingState extends AddressState {}

// /// State when authentication is successful.
// // final class AddressSucessState extends AddressState {
// //   final String addressModel;
// //   AddressSucessState(this.addressModel);
// // }

// final class AddressSucessState extends AddressState {
//   final List<AddressModel> addresses;
//   AddressSucessState(this.addresses);
// }


// /// State when authentication fails.
// final class AddressFailure extends AddressState {
//   final String errorMessage;

//   AddressFailure(this.errorMessage);
// }

import 'package:equatable/equatable.dart';
import '../../domain/entities/address_entity.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressEntity> addresses;

  const AddressLoaded(this.addresses);

  @override
  List<Object?> get props => [addresses];
}

class AddressOperationSuccess extends AddressState {}

class AddressError extends AddressState {
  final String message;

  const AddressError(this.message);

  @override
  List<Object?> get props => [message];
}
