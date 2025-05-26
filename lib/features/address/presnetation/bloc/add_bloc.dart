// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:konkan_bite_food/features/address/domain/usecases/address_usecase.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';

// class AddressBloc extends Bloc<AddressEvent, AddressState> {
//   final StoreAddressUsecase storeAddress;

//   AddressBloc({required this.storeAddress}) : super(AddressInitial()) {
//     on<StoreAddressEvent>((event, emit) async {
//       emit(AddressLoading());
//       final result = await storeAddress(event.address);
//       result.fold(
//         (failure) => emit(AddressFailure(failure.message)),
//         (success) => emit(AddressSuccess("Address saved successfully")),
//       );
//     });
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
// import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';

// class AddressBloc extends Bloc<AddressEvent, AddressState> {
//   final AddressRepository _addressRepository;

//   AddressBloc(this._addressRepository) : super(AddressInitialState()) {
//     on<LoadAddressEvent>((event, emit) async {
//       emit(AddressLoadingState());
//       try {
//         final address = await _addressRepository.fetchAddresses();
//         emit(AddressSucessState(address)); // should return List<AddressModel>
//       } catch (e) {
//         emit(AddressFailure(e.toString()));
//       }
//     });
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkan_bite_food/core1/services/secure_storage_service.dart';
import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';
import 'package:konkan_bite_food/features/address/domain/usecases/address_usecase.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddAddressUsecase addAddress;
  final FetchAddressUsecase fetchAddress;
  final UpdateAddress updateAddress;
  final DeleteAddress deleteAddress;

  AddressBloc({
    required this.addAddress,
    required AddAddressUsecase addressUsecase,
    required AddressRepository repository,
    required SecureStorageService secureStorage,

    required this.fetchAddress,
    required this.updateAddress,
    required this.deleteAddress, 
  }) : super(AddressInitial()) {
    on<FetchAddressesEvent>(_onFetch);
    on<AddAddressEvent>(_onAdd);
    on<UpdateAddressEvent>(_onUpdate);
    on<DeleteAddressEvent>(_onDelete);
  }

  Future<void> _onFetch(FetchAddressesEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());
    final result = await fetchAddress();
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (addresses) => emit(AddressLoaded(addresses)),
    );
  }

  Future<void> _onAdd(AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());
//     final result = await addAddress(event.address);
// result.fold(
//   (failure) => emit(AddressError(failure.message)),
//   (newAddress) => emit(AddressOperationSuccess(newAddress)), // ✅ Return added address
// );

    final result = await addAddress(event.address);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (_) => emit(AddressOperationSuccess()),
    );
  }

  Future<void> _onUpdate(UpdateAddressEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());
    final result = await updateAddress(event.address);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (_) => emit(AddressOperationSuccess()),
    );
  }

  Future<void> _onDelete(DeleteAddressEvent event, Emitter<AddressState> emit) async {
    emit(AddressLoading());
    final result = await deleteAddress(event.addressId);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (_) => emit(AddressOperationSuccess()),
    );
  }
}
