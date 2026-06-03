import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/%20services/product_service.dart';
import 'package:sweetify_app/model/get_product/product_model.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;
  RxList<String> images = [
    'images/home_screen_images/sale_banner_photo.png',
    'images/home_screen_images/sale_banner_photo.png',
    'images/home_screen_images/sale_banner_photo.png',
  ].obs;
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  final ProductService _service = ProductService();

  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      final result = await _service.getProducts();
      products.value = result.data;
    } catch (e) {
      Get.snackbar("Error", "Something went wrong", );
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
