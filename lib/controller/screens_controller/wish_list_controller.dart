import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/model/get_product/product_model.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';



class WishListController extends GetxController {

  RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  // ADD
  void addToWishlist(ProductModel product) {
    if (!isFavorite(product.id)) {
      favoriteProducts.add(product);
      Get.snackbar("WishList", "Added to wishlist");
    }
  }

  // REMOVE
  void removeFromWishlist(int productId) {
    favoriteProducts.removeWhere((item) => item.id == productId);
    Get.snackbar("WishList", "Removed from wishlist");
  }

  // TOGGLE (اختياري فقط للاستخدام العام)
  void toggleFavorite(ProductModel product) {
    if (isFavorite(product.id)) {
      removeFromWishlist(product.id);
    } else {
      addToWishlist(product);
    }
  }

  bool isFavorite(int productId) {
    return favoriteProducts.any((item) => item.id == productId);
  }

  void showRemoveWishlistDialog(ProductModel product) {
    Get.defaultDialog(
      title: "Remove from wishlist",
      middleText: "Are you sure you want to remove this product from your wishlist?",
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: AppText.caption(
            "Cancel",
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(closeOverlays: true);
            removeFromWishlist(product.id); // ✅ الصحيح
          },
          child: AppText.caption(
            "Remove",
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}