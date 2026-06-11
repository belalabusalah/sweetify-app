import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/main_navigation_controller.dart';
import 'package:sweetify_app/view/screens/cart_screen/cart_screen.dart';
import 'package:sweetify_app/view/screens/home_screen/home_screen.dart';
import 'package:sweetify_app/view/screens/profile_screen/profile_screen.dart';
import 'package:sweetify_app/view/screens/wish_list_screen.dart';
import 'package:sweetify_app/view/widgets/bottom_navigation_bar_section.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainNavigationController _mainNavigationController = Get.find();

  final List<Widget> screens = [
    HomeScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: IndexedStack(
          index: _mainNavigationController.currentIndex.value,
          children: screens,
        ),

        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _mainNavigationController.currentIndex.value,
          onTap: _mainNavigationController.changeIndex,
        ),
      ),
    );
  }
}