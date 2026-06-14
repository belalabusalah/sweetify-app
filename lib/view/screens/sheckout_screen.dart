import 'package:AURA/controller/screens_controller/cart_controller.dart';
import 'package:AURA/view/widgets/elevated_button_app_custom.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Remove from wishlist",
              middleText:
                  "Are you sure you want to remove this product from your wishlist?",
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
                    Get.back();
                    Get.back();
                  },
                  child: AppText.caption(
                    "Exit",
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Checkout"),
        centerTitle: true,
      ),

      bottomNavigationBar: CustomElevatedButton(
        text: 'Submit Order',
        radius: 8.r,
        color: Color(0xFF483028),
        onPressed: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),

        children: [
          SizedBox(height: 25.h),

          sectionTitle("Order Summary"),

          Obx(() {
            return _cartController.cartItems.isEmpty
                ? AppText.title("No items in cart")
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartController.cartItems[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(10.w),
                        decoration: cardDecoration(),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  // image
                                  Container(
                                    width: 70.w,
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item.product.thumbnail,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 12.w),
                                  // name + price
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "${item.product.finalUnitPrice} KWD",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                          ),
                                        ),

                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),

                                  // quantity
                                  CircleAvatar(
                                    radius: 14.r,
                                    child: Text(
                                      item.quantity.toString(),
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                _qtyButton(
                                  icon: Icons.remove,
                                  onTap: () {
                                    item.quantity > 1
                                        ? _cartController.decreaseQty(
                                            item.product.id,
                                          )
                                        : Get.defaultDialog(
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
                                                  Get.back();
                                                  _cartController
                                                      .showRemoveCartDialog(
                                                        item.product,
                                                      );
                                                },
                                                child: AppText.caption(
                                                  "Remove",
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          );
                                  },
                                ),

                                const SizedBox(width: 10),

                                Text("${item.quantity}"),

                                const SizedBox(width: 10),

                                _qtyButton(
                                  icon: Icons.add,
                                  onTap: () => _cartController.increaseQty(
                                    item.product.id,
                                  ),
                                ),
                                SizedBox(width: 120.w),
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
                                      text: 'Remove',
                                      height: 25.h,
                                      fontSizeText: 8.sp,
                                      iconSize: 14.r,
                                      icon: Icons.delete,
                                      textColor: Color(0xFF572717),
                                      color: Colors.white,
                                      onPressed: () {
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
                                                _cartController.removeItem(
                                                  item.product.id,
                                                );
                                              },
                                              child: AppText.caption(
                                                "Remove",
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            Divider(thickness: 1.h),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.body("Total Order(${item.quantity}) :"),
                                AppText.body(
                                  "${item.product.finalUnitPrice * item.quantity} kwd ",
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }),

          SizedBox(height: 25.h),

          sectionTitle("Shipping Address"),

          Container(
            padding: EdgeInsets.all(12.w),
            decoration: cardDecoration(),

            child: Row(
              children: [
                Icon(Icons.location_on_outlined, size: 22.sp),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                        "123 Main street, New York",
                        style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                Icon(Icons.add_circle_outline, size: 22.sp),
              ],
            ),
          ),

          SizedBox(height: 25.h),

          sectionTitle("Shipping Method"),

          shippingTile(
            title: "Standard Shipping",
            subtitle: "Delivery within 3-5 days",
          ),

          SizedBox(height: 25.h),

          sectionTitle("Payment Method"),

          paymentTile("Add new card", Icons.credit_card),

          paymentTile("PayPal", Icons.circle),

          paymentTile("Google Pay", Icons.g_mobiledata),

          SizedBox(height: 25.h),

          sectionTitle("Order Summary"),

          Container(
            padding: EdgeInsets.all(14.w),
            decoration: cardDecoration(),

            child: Column(
              children: [
                summaryRow("Subtotal", "\$35.00"),

                summaryRow("Shipping", "\$5.00"),

                Divider(),

                summaryRow("Total", "\$40.00", bold: true),
              ],
            ),
          ),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget shippingTile({required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(12.w),

      decoration: cardDecoration(),

      child: Row(
        children: [
          Icon(Icons.local_shipping_outlined),

          SizedBox(width: 10.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),

              Text(subtitle, style: TextStyle(fontSize: 10.sp)),
            ],
          ),
        ],
      ),
    );
  }

  Widget paymentTile(String title, IconData icon) {
    return Row(
      children: [
        Radio(value: true, groupValue: false, onChanged: (v) {}),

        Icon(icon, size: 18.sp),

        SizedBox(width: 10.w),

        Text(title, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget summaryRow(String title, String value, {bool bold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(10.r),

      border: Border.all(color: Colors.grey.shade200),
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
