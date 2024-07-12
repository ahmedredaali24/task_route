import 'package:task_route/domin/repository/data_source/products_remote_data_ssource.dart';
import 'package:task_route/domin/repository/repository/product_repository.dart';
import 'package:task_route/domin/use_cases/get_product_use_case.dart';

import '../data/api/products_api_manger.dart';
import '../data/repository/data_source/product_data_source_impl.dart';
import '../data/repository/repository/product_repository_impl.dart';

GetProductUseCase injectGetProductUseCase() {
  return GetProductUseCase(productRepository: injectProductRepository());
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImpl(
      productsRemoteDataSource: injectProductsRemoteDataSource());
}

ProductsRemoteDataSource injectProductsRemoteDataSource() {
  return ProductDataSourceImpl(
      productsApiManger: ProductsApiManger.getInstance());
}
