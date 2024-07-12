import 'package:dartz/dartz.dart';

import '../../domin/entity/failures.dart';
import '../model/responses/ProductResponseDto.dart';
import 'api_cons/api_const.dart';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ProductsApiManger {
  ProductsApiManger._();

  static ProductsApiManger? instance;

  static ProductsApiManger getInstance() {
    instance ??= ProductsApiManger._();
    return instance!;
  }

  Future<Either<Failures, ProductResponseDto>> getProduct() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, EndPoints.productApi);
      var response = await http.get(
        url,
      );
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: "Error"));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}
