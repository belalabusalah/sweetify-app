import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/cart_controller.dart';
import 'package:sweetify_app/controller/screens_controller/wish_list_controller.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';

import '../../../model/get_product/product_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final ProductModel product = Get.arguments as ProductModel;
  final WishListController _wishListController = Get.find();
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        final cartItem = _cartController.getCartItem(product.id);
        final inCart = cartItem != null;
        final qty = cartItem?.quantity ?? 0;
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Row(
            spacing: 4.w,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 24,
                color: Color(0xFF483028),
              ),
              Container(
                width: 110.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: inCart
                          ? () {
                              _cartController.decreaseQty(product.id);
                            }
                          : null,
                      icon: Text(
                        "-",
                        style: TextStyle(
                          color: Color(0xFF1C1C1E),
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      "$qty",
                      style: TextStyle(
                        color: Color(0xFF1C1C1E),
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _cartController.addToCart(product);
                      },
                      icon: Text(
                        "+",
                        style: TextStyle(
                          color: Color(0xFF1C1C1E),
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: CustomElevatedButton(
                  text: inCart ? 'Remove In Cart' : 'Add To Cart',
                  fontSizeText: 12.sp,
                  height: 45.h,
                  width: 300.w,
                  icon: Icons.card_travel,
                  color: inCart ? Colors.red : Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    _cartController.toggleCart(product);
                  },
                ),
              ),
            ],
          ),
        );
      }),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350.h,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            actions: [
              Obx(
                () => IconButton(
                  icon: Icon(
                    _wishListController.isFavorite(product.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _wishListController.toggleFavorite(product);
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: product.id,
                child: Image.network(product.thumbnail, fit: BoxFit.cover),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Text(
                        "${product.finalUnitPrice} KWD",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      Icon(Icons.star, color: Colors.amber, size: 18.sp),

                      SizedBox(width: 4.w),

                      Text("4.8"),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    product.shortDescription,
                    style: TextStyle(height: 1.6, color: Colors.grey[700]),
                  ),

                  SizedBox(height: 25.h),

                  Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _item("Product ID", product.id.toString()),
                        _item("Price", "${product.finalUnitPrice} KWD"),
                      ],
                    ),
                  ),

                  SizedBox(height: 80.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
