//
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   const CustomBottomNavigationBar({super.key, required this.currentIndex});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  BottomNavigationBar(
//         currentIndex: currentIndex,
//         backgroundColor: Colors.red,
//       selectedItemColor: Colors.orange,
//       unselectedItemColor: Color(0xFF7A5242),
//         onTap: (index) {
//           if (index == 0) {
//             Get.offNamed("/homeScreen");
//           } else if (index == 1) {
//             Get.toNamed("/wishListScreen");
//           } else if (index == 2) {
//             Get.toNamed("/cardScreen");
//           }else if (index == 3) {
//             Get.toNamed("/profileScreen");
//           }
//         },
//
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_home_outlined),
//             label:"home",
//           ),
//           BottomNavigationBarItem(
//             label: "wishList",
//             icon: Icon(Icons.favorite_border,),
//           ),
//           BottomNavigationBarItem(
//             label:"card",
//             icon: Icon(Icons.shopping_cart_outlined),
//           ),
//           BottomNavigationBarItem(
//             label:"profile",
//             icon: Icon(Icons.person_off),
//           ),
//         ],
//       );
//
//   }
// }

  import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

   const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,

      onTap: onTap,

      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text("Home"),
          selectedColor: Colors.orange,
        ),

        /// Wishlist
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Wishlist"),
          selectedColor: Colors.orange,
        ),

        /// Cart
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          title: Text("Cart"),
          selectedColor: Colors.orange,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person_outline),
          title: Text("Profile"),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}