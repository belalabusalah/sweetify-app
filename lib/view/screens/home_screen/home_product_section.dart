import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/cart_controller.dart';
import 'package:AURA/controller/screens_controller/home_controller.dart';
import 'package:AURA/controller/screens_controller/wish_list_controller.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';

class HomeProductSection extends StatelessWidget {
  HomeProductSection({super.key});
  final HomeController _homeController = Get.find();
  final WishListController _wishListController = Get.find();
  final CartController _cartController = Get.find();
  late final previewProducts = _homeController.products.take(2).toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Obx(() {
            if (_homeController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container(
              decoration: BoxDecoration(),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemCount: _homeController.products.length > 2
                    ? 2
                    : _homeController.products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = _homeController.products[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed("/detailsScreen", arguments: product);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),

                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.black12,
                            blurRadius: 3,
                          ),
                          BoxShadow(
                            offset: Offset(-5, -5),
                            color: Colors.black12,
                            blurRadius: 3,
                          ),
                          BoxShadow(
                            offset: Offset(5, -5),
                            color: Colors.black12,
                            blurRadius: 3,
                          ),
                          BoxShadow(
                            offset: Offset(-5, 5),
                            color: Colors.white12,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                product.thumbnail, // 🔥 من API
                                height: 100.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 10.h,
                                right: 10.w,
                                child: Container(
                                  height: 30.h,
                                  width: 37.w,
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Obx(
                                    () => IconButton(
                                      icon: Icon(
                                        _wishListController.isFavorite(
                                              product.id,
                                            )
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        _wishListController.toggleFavorite(
                                          product,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10.h,
                                left: 10.w,
                                child: Container(
                                  height: 30.h,
                                  width: 37.w,
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Obx(
                                    () => IconButton(
                                      icon: Icon(
                                        _cartController.isInCart(product.id)
                                            ? Icons.shopping_cart
                                            : Icons.shopping_cart_outlined,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        _cartController.toggleCart(product);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.caption(product.name, maxLines: 3),
                                AppText.body(
                                  product.shortDescription,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                ),
                                AppText.subtitle(
                                  "${product.finalUnitPrice} KWD",
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

/*Row(
            children: [
              AppText.body(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                "See All ",
              ),
              SizedBox(width: 42.w),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(-1, -1),
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: CustomElevatedButton(
                    text: 'See All',
                    height: 25.h,
                    fontSizeText: 8.sp,
                    iconSize: 14.r,
                    icon: Icons.sort_rounded,
                    textColor: Color(0xFF572717),
                    color: Colors.white,
                    onPressed: () {Get.toNamed("/shoppingScreen");},
                  ),
                ),
              ),


            ],
          ),*/
