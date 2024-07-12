import 'package:dartz/dartz.dart';

import '../entity/ProductResponseEntity.dart';
import '../entity/failures.dart';
import '../repository/repository/product_repository.dart';

class GetProductUseCase {
  ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productRepository.getProducts();
  }
}
