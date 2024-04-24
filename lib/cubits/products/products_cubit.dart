import 'package:api_task/data/models/product_response.dart';
import 'package:api_task/data/services/products_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ProductsService _productsService = ProductsService();

  List<ProductResponse>? products;
  final List<ProductResponse> deletedProducts = [];

  void getProducts() async {
    try {
      emit(ProductsLoading());
      products = await _productsService.getProducts();
      emit(ProductsSuccess(products ?? []));
    } catch (e) {
      emit(ProductsError());
    }
  }

  void removeProduct(int id) {
    products!.removeWhere((product) {
      if(product.id == id){
        deletedProducts.add(product);
        return true;
      }return false;
    });
    emit(ProductsSuccess(products!));
  }

  void recoveryProduct(int id, ProductResponse product){
    products!.insert(0, product);
    deletedProducts.removeWhere((product) => (product.id == id));
    emit(ProductsSuccess(products!));
  }

  void deleteProducts(){
    deletedProducts.clear();
    emit(ProductsSuccess(products!));
  }
}
