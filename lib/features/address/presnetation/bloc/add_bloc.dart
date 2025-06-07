

// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/usecases/address_usecase.dart';
// import '../../presnetation/bloc/add_event.dart';
// import '../../presnetation/bloc/add_state.dart';

// class AddressBloc extends Bloc<AddressEvent, AddressState> {
//   final AddAddressUsecase addAddress;
//   final FetchAddressUsecase fetchAddress;
//   final UpdateAddress updateAddress;
//   final DeleteAddress deleteAddress;

//   AddressBloc({
//     required this.addAddress,
//     required this.fetchAddress,
//     required this.updateAddress,
//     required this.deleteAddress,
//   }) : super(AddressInitial()) {
//     on<FetchAddressesEvent>(_onFetch);
//     on<AddAddressEvent>(_onAdd);
//     on<UpdateAddressEvent>(_onUpdate);
//     on<DeleteAddressEvent>(_onDelete);
//   }

//   Future<void> _onFetch(
//       FetchAddressesEvent event, Emitter<AddressState> emit) async {
//     emit(AddressLoading());

//     final result = await fetchAddress();
//     result.fold(
//       (failure) => emit(AddressError(failure.message)),
//       (addresses) => emit(AddressLoaded(addresses)),
//     );
//   }

//   Future<void> _onAdd(AddAddressEvent event, Emitter<AddressState> emit) async {
//     emit(AddressLoading());

//     final result = await addAddress(event.address);
//     result.fold(
//       (failure) => emit(AddressError(failure.message)),
//       (_) => emit(const AddressOperationSuccess()),
//     );
//   }

//   Future<void> _onUpdate(UpdateAddressEvent event, Emitter<AddressState> emit) async {
//     emit(AddressLoading());

//     final result = await updateAddress(event.address);
//     result.fold(
//       (failure) => emit(AddressError(failure.message)),
//       (_) => emit(const AddressOperationSuccess()),
//     );
//   }

//   Future<void> _onDelete(DeleteAddressEvent event, Emitter<AddressState> emit) async {
//     emit(AddressLoading());

//     final result = await deleteAddress(event.addressId);
//     result.fold(
//       (failure) => emit(AddressError(failure.message)),
//       (_) => emit(const AddressOperationSuccess()),
//     );
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';


class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository repository;

  AddressBloc(this.repository) : super(AddressInitial()) {
    on<FetchAddresses>((event, emit) async {
      emit(AddressLoading());
      try {
        final addresses = await repository.fetchAddresses();
        emit(AddressLoaded(addresses));
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });

    on<AddAddress>((event, emit) async {
      try {
        await repository.addAddress(event.address);
        add(FetchAddresses());
      } catch (e) {
        emit(AddressError(e.toString()));
      }
    });
  }
}