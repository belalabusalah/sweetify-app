import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/cart_controller.dart';

class CartItemCard extends StatelessWidget {
  late final CartItem item;

  CartItemCard({required this.item});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )
        ],
      ),

      child: Row(
        children: [

          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.product.thumbnail,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          // info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "${item.product.finalUnitPrice} KWD",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // qty controller
                Row(
                  children: [

                    _qtyButton(
                      icon: Icons.remove,
                      onTap: ()  {
                        item.quantity > 1?
                        controller.decreaseQty(item.product.id): controller. showRemoveCartDialog(item.product);;
                      }
                    ),

                    const SizedBox(width: 10),

                    Text("${item.quantity}"),

                    const SizedBox(width: 10),

                    _qtyButton(
                      icon: Icons.add,
                      onTap: () => controller.increaseQty(item.product.id),
                    ),
                  ],
                )
              ],
            ),
          ),

          // delete
          IconButton(
            onPressed: () {
             controller. showRemoveCartDialog(item.product);
             /* Get.defaultDialog(
                title: "Remove from cart",
                middleText: "Are you sure you want to remove this product?",
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text("Cancel"),
                  ),

                  TextButton(
                    onPressed: () {
                      Get.back(closeOverlays: true);
                      controller.removeItem(item.product.id);
                    },
                    child: Text("Remove"),
                  ),
                ],
              );*/
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          )
        ],
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
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