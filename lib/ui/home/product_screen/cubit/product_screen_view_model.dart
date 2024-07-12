import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domin/entity/ProductResponseEntity.dart';
import '../../../../domin/use_cases/get_product_use_case.dart';
import 'product_screen_states.dart';

class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  GetProductUseCase getProductUseCase;

  ProductScreenViewModel({required this.getProductUseCase})
      : super(ProductScreenInitialState());

  List<ProductsEntity> productList = [];
  int numOfCartItem = 0;
  final bool isWishListed = false;

  Future<void> refreshProducts() async {
    await getProducts();
  }
  Future<void> getProducts() async {
    emit(ProductScreenLoadingState(loadingMessage: "Loading..."));
    var either = await getProductUseCase.invoke();

    either.fold((l) => emit(ProductScreenErrorState(errorMessage: l)), (r) {
      productList = r.products ?? [];
      emit(ProductScreenSuccessState(productResponseEntity: r));
    });
  }
}
