import 'package:demo_bloc/product_event.dart';
import 'package:demo_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEventBase, ProductStateBase> {
  ProductBloc() : super(ProductStateInit(value: 0)) {
    on<IncreaseEvent>((event, emit) {
      emit(ProductState(value: state.value + 1));
    });
    on<DecreaseEvent>((event, emit) {
      emit(ProductState(value: state.value - 1));
    });
  }

}