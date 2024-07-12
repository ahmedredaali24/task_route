import 'package:dartz/dartz.dart';

import '../../entity/ProductResponseEntity.dart';
import '../../entity/failures.dart';

abstract class ProductRepository{
  Future<Either<Failures, ProductResponseEntity>> getProducts();

}