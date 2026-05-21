import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/menu_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DetilsScreen")),
      drawer: CustomDrawer(),
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
