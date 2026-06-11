import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/cart_controller.dart';

class CartBottomBar extends StatelessWidget {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          )
        ],
      ),

      child: Row(
        children: [

          // total
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Total"),
              Obx(() => Text(
                "${controller.totalPrice.toStringAsFixed(2)} KWD",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
            ],
          ),

          const Spacer(),

          // checkout button
          ElevatedButton(
            onPressed: () {
              Get.snackbar("Checkout", "Proceeding to payment...");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 12,
              ),
            ),
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}