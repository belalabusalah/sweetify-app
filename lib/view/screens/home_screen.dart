import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home.title".tr)),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed("/profileScreen");
            },
            child: Text("login".tr),
          ),
        ),
      ),
    );
  }
}
