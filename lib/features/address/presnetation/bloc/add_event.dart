

// import 'package:meta/meta.dart';

// @immutable
// sealed class AddressEvent{}

// final class LoadAddressEvent extends AddressEvent {}

import 'package:equatable/equatable.dart';
import '../../domain/entities/address_entity.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object?> get props => [];
}

class FetchAddressesEvent extends AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final AddressEntity address;

  const AddAddressEvent(this.address);

  @override
  List<Object?> get props => [address];
}

class UpdateAddressEvent extends AddressEvent {
  final AddressEntity address;

  const UpdateAddressEvent(this.address);

  @override
  List<Object?> get props => [address];
}

class DeleteAddressEvent extends AddressEvent {
  final String addressId;

  const DeleteAddressEvent(this.addressId);

  @override
  List<Object?> get props => [addressId];
}
