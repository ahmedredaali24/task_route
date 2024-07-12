import '../../../../domin/entity/ProductResponseEntity.dart';
import '../../../../domin/entity/failures.dart';

abstract class ProductScreenStates {}

class ProductScreenInitialState extends ProductScreenStates {}

class ProductScreenErrorState extends ProductScreenStates {
  Failures? errorMessage;

  ProductScreenErrorState({required this.errorMessage});
}

class ProductScreenSuccessState extends ProductScreenStates {
  ProductResponseEntity productResponseEntity;

  ProductScreenSuccessState({required this.productResponseEntity});
}

class ProductScreenLoadingState extends ProductScreenStates {
  String? loadingMessage;

  ProductScreenLoadingState({required this.loadingMessage});
}
