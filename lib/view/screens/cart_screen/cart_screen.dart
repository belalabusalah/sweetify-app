import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/cart_controller.dart';
import 'package:sweetify_app/view/screens/cart_screen/cart_bottom_bar_section.dart';
import 'package:sweetify_app/view/screens/cart_screen/cart_item_card_section.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_cartController.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 90.sp,
                  color: Colors.grey.shade400,
                ),
                SizedBox(height: 16.h),
                AppText.subtitle("Your cart is empty", color: Colors.grey),
                SizedBox(height: 8.h),
                AppText.body(
                  "Add products you cart to see them here",
                  color: Colors.grey,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _cartController.cartItems.length,
          itemBuilder: (context, index) {
            final item = _cartController.cartItems[index];

            return CartItemCard(item: item);
          },
        );
      }),

      bottomNavigationBar: Obx(() {
        if (_cartController.cartItems.isEmpty) {
          return Container(
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
          );
        }

        return CartBottomBar();
      }),
    );
  }
}
