import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/wish_list_controller.dart';

class RemoveWishlistDialog extends StatefulWidget {
  final dynamic product;

  const RemoveWishlistDialog({super.key, required this.product});

  @override
  State<RemoveWishlistDialog> createState() => _RemoveWishlistDialogState();
}

class _RemoveWishlistDialogState extends State<RemoveWishlistDialog> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 25),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // HANDLE BAR (UX DETAIL IMPORTANT)
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const SizedBox(height: 18),

              // ICON
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.redAccent,
                  size: 34,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Remove from wishlist?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "This item will be removed from your wishlist.\nYou can undo this action shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 22),

              // BUTTONS
              Row(
                children: [

                  // CANCEL
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // REMOVE
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _removeItem,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: isLoading
                          ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        "Remove",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _removeItem() async {
    setState(() => isLoading = true);

    // HAPTIC (important UX detail)
    HapticFeedback.mediumImpact();

    final controller = Get.find<WishListController>();
    final removedItem = widget.product;

    Get.back(); // close sheet first

    controller.toggleFavorite(removedItem);

    // AMAZON STYLE UNDO SNACKBAR
    Get.snackbar(
      "Removed from wishlist",
      "Item removed successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      mainButton: TextButton(
        onPressed: () {
          controller.toggleFavorite(removedItem);
          Get.closeCurrentSnackbar();
        },
        child: const Text(
          "UNDO",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}