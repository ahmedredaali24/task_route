import 'package:dartz/dartz.dart';

import '../../../domin/entity/ProductResponseEntity.dart';
import '../../../domin/entity/failures.dart';
import '../../../domin/repository/data_source/products_remote_data_ssource.dart';
import '../../../domin/repository/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductsRemoteDataSource productsRemoteDataSource;

  ProductRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return productsRemoteDataSource.getProducts();
  }
}
