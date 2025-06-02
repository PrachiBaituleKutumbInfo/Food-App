import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';

import 'package:equatable/equatable.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final AddressEntity addresses;

  const AddressLoaded(this.addresses);

  @override
  List<Object?> get props => [addresses];
}

class AddressOperationSuccess extends AddressState {
  const AddressOperationSuccess();

  @override
  List<Object?> get props => [];
}

class AddressError extends AddressState {
  final String message;

  const AddressError(this.message);

  @override
  List<Object?> get props => [message];
}
