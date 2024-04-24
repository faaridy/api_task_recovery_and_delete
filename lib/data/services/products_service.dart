import 'package:api_task/constants/endpoints.dart';
import 'package:api_task/data/models/product_response.dart';
import 'package:dio/dio.dart';

abstract class ProductContract {
  Future<List<ProductResponse>> getProducts();
}

class ProductsService implements ProductContract {
  final _dio = Dio();
  @override
  Future<List<ProductResponse>> getProducts() async {
    final response = await _dio.get(Endpoints.products);
    final List data = response.data;
    if (response.statusCode == 200) {
      return data.map((e) => ProductResponse.fromJson(e)).toList();
    }
    throw Exception();
  }
}
