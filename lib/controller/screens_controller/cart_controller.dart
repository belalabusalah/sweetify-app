import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/model/get_product/product_model.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  double shippingCost = 5.0;

  bool isInCart(int productId) {
    return cartItems.any((item) => item.product.id == productId);
  }

  void toggleCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      cartItems.removeAt(index); // ❌ حذف
      Get.snackbar("Cart", "Removed from cart");
    } else {
      cartItems.add(CartItem(product: product)); // ➕ إضافة
      Get.snackbar("Cart", "Added to cart");
    }

    cartItems.refresh();
  }

  CartItem? getCartItem(int productId) {
    try {
      return cartItems.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }

  // إضافة منتج للسلة
  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);


    if (index != -1) {
      cartItems[index].quantity++;
      Get.snackbar("Cart", "Quantity increased");
    } else {
      cartItems.add(CartItem(product: product));
      Get.snackbar("Cart", "Added to cart");
    }

    cartItems.refresh();
  }

  // حذف منتج كامل
  void removeItem(int productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
    Get.snackbar("Cart", "Item removed from cart");
  }

  // زيادة كمية
  void increaseQty(int productId) {
    final item = cartItems.firstWhere((item) => item.product.id == productId);

    item.quantity++;
    Get.snackbar("Cart", "Quantity increased");
    cartItems.refresh();
  }

  // تقليل كمية
  void decreaseQty(int productId) {
    final item = cartItems.firstWhere((item) => item.product.id == productId);

    if (item.quantity > 1) {
      item.quantity--;
      Get.snackbar("Cart", "Quantity decreased");
    } else {
      removeItem(productId);
      Get.snackbar("Cart", "Item removed from cart");
    }
    cartItems.refresh();
  }

  // إجمالي السعر
  double get totalPrice {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item.product.finalUnitPrice * item.quantity),
    );
  }

  void showRemoveCartDialog(ProductModel product) {

    Get.defaultDialog(
      title: "Remove from cart",
      middleText:
      "Are you sure you want to remove this product from your cart?",

      actions: [
        TextButton(
          onPressed: () {
            Get.back(closeOverlays: true);

          },
          child: AppText.caption(
            "Cancel",
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(closeOverlays: true);

            removeItem(product.id);

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
