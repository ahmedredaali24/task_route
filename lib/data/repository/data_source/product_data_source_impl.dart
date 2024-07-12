import 'package:dartz/dartz.dart';

import '../../../domin/entity/ProductResponseEntity.dart';
import '../../../domin/entity/failures.dart';
import '../../../domin/repository/data_source/products_remote_data_ssource.dart';
import '../../api/products_api_manger.dart';

class ProductDataSourceImpl extends ProductsRemoteDataSource {
  ProductsApiManger productsApiManger;

  ProductDataSourceImpl({required this.productsApiManger});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await productsApiManger.getProduct();
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
