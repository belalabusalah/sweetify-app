import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/cart_controller.dart';
import 'package:AURA/view/widgets/elevated_button_app_custom.dart';

import '../../controller/screens_controller/wish_list_controller.dart';
import '../widgets/text_app_custom.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final WishListController _wishListController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Wishlist"),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          spacing: 4.w,
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: 'Continue Shopping',
                fontSizeText: 16.sp,
                height: 45.h,
                width: 300.w,
                color: Color(0xFF483028),
                textColor: Colors.white,
                onPressed: () {
                  Get.toNamed("/homeScreen");
                },
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (_wishListController.favoriteProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border_rounded,
                  size: 90.sp,
                  color: Colors.grey.shade400,
                ),
                SizedBox(height: 16.h),
                AppText.subtitle("Your wishlist is empty", color: Colors.grey),
                SizedBox(height: 8.h),
                AppText.body(
                  "Add products you love to see them here",
                  color: Colors.grey,
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText.title(
                  "Wish List (${_wishListController.favoriteProducts.length})",
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  itemCount: _wishListController.favoriteProducts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final product = _wishListController.favoriteProducts[index];

                    return Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              product.thumbnail,
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          /// Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.caption(product.name, maxLines: 2),

                                SizedBox(height: 6.h),

                                AppText.body(
                                  product.shortDescription,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 11,
                                ),

                                SizedBox(height: 8.h),

                                AppText.subtitle(
                                  "${product.finalUnitPrice} KWD",
                                  fontSize: 14,
                                ),

                                SizedBox(height: 12.h),

                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _cartController.addToCart(product);
                                      },
                                      child: AppText.caption(
                                        "Add to cart",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    /// Delete Favorite
                                    TextButton(
                                      onPressed: () {
                                        _wishListController
                                            .showRemoveWishlistDialog(product);
                                      },
                                      child: AppText.caption(
                                        "Remove",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
