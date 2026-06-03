

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;
  RxList<String> images = [
    'images/home_screen_images/sale_banner_photo.png',
    'images/home_screen_images/sale_banner_photo.png',
    'images/home_screen_images/sale_banner_photo.png',
  ].obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}