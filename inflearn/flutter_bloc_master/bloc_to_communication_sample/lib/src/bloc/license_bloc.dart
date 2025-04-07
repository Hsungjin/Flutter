import 'package:bloc_to_communication_sample/src/bloc/product_bloc.dart';
import 'package:bloc_to_communication_sample/src/repository/license_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LicenseBloc extends Bloc<LicenseEvent, LicenseState> {
  LicenseRepository _licenseRepository;

  LicenseBloc(this._licenseRepository) : super(LicenseState(false)) {
    on<BuyLicenseEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      var result = await _licenseRepository.buyLicense();
      emit(LicenseState(result));
    });
  }
}

abstract class LicenseEvent extends Equatable {}

class BuyLicenseEvent extends LicenseEvent {
  @override
  List<Object?> get props => [];
}

class LicenseState extends Equatable {
  bool hasLicense;

  LicenseState(this.hasLicense);

  @override
  List<Object?> get props => [hasLicense];
}
