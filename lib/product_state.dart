import 'package:equatable/equatable.dart';

abstract class ProductStateBase extends Equatable{
  int value;

  ProductStateBase({required this.value});
}

class ProductStateInit extends ProductStateBase {

  ProductStateInit({required super.value});

  @override
  List<Object?> get props => [value];
}

class ProductState extends ProductStateBase {

  ProductState({required super.value});

  @override
  List<Object?> get props => [value];

}