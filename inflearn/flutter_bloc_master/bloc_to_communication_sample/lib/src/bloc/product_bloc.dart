import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_to_communication_sample/src/repository/license_repository.dart';
import 'package:bloc_to_communication_sample/src/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final LicenseRepository licenseRepository;
  ProductBloc(this.productRepository, this.licenseRepository) : super(InitProductState()) {
    on<ProductEvent>((event, emit) async {
      if (event is DefaultLoadProductEvent) {
        await _defaultLoadProduct(event, emit);
      } else if (event is PayLoadProductEvent) {
        await _payLoadProduct(event, emit);
      }
    }, transformer: sequential());
    add(DefaultLoadProductEvent());
    add(PayLoadProductEvent(false));
    licenseRepository.stream.listen((event) {
      if (event) {
        add(PayLoadProductEvent(true));
      }
    });
  }

  _defaultLoadProduct(DefaultLoadProductEvent event, emit) async {
    emit(LoadingProductState(defaultItems: state.defaultItems, payItems: state.payItems));
    var result = await productRepository.loadDefaultProduct();
    emit(LoadedProductState(defaultItems: result, payItems: state.payItems));
  }
  _payLoadProduct(PayLoadProductEvent event, emit) async {
    emit(LoadingProductState(defaultItems: state.defaultItems, payItems: state.payItems));
    var result = await productRepository.loadPayDefaultProduct(event.hasLicense);
    emit(LoadedProductState(defaultItems: state.defaultItems, payItems: result));
  }

  @override
  void onChange(Change<ProductState> change) {
    super.onChange(change);
  }

  @override
  void onTransition(Transition<ProductEvent, ProductState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}

abstract class ProductEvent extends Equatable {}

class DefaultLoadProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class PayLoadProductEvent extends ProductEvent {
  final bool hasLicense;
  PayLoadProductEvent(this.hasLicense);

  @override
  List<Object?> get props => [hasLicense];
}

abstract class ProductState extends Equatable {
  final List<String>? defaultItems;
  final List<String>? payItems;

  const ProductState({this.defaultItems, this.payItems});
}

class InitProductState extends ProductState {
  InitProductState() : super(defaultItems: [], payItems: []);
  @override
  List<Object?> get props => [defaultItems, payItems];
}

class LoadingProductState extends ProductState {
  const LoadingProductState({super.defaultItems, super.payItems});
  @override
  List<Object?> get props => [defaultItems, payItems];
}

class LoadedProductState extends ProductState {
  const LoadedProductState({super.defaultItems, super.payItems});
  @override
  List<Object?> get props => [defaultItems, payItems];
}

class ErrorProductState extends ProductState {
  final String errorMessage;
  const ErrorProductState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
