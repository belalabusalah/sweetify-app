import 'package:get/get.dart';
import 'package:sweetify_app/model/get_product/product_model.dart';

class WishListController extends GetxController {

  RxList<ProductModel> favoriteProducts =
      <ProductModel>[].obs;

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product.id)) {
      favoriteProducts.removeWhere(
            (item) => item.id == product.id,
      );
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(int productId) {
    return favoriteProducts.any(
          (item) => item.id == productId,
    );
  }
}