import 'package:AURA/model/get_product/product_model.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class ShoppingController extends GetxController {

  final HomeController homeController = Get.find<HomeController>();

  List<ProductModel> get products => homeController.products;

}