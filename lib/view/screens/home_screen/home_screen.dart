import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/view/screens/home_screen/home_header_section.dart';
import 'package:sweetify_app/view/screens/home_screen/home_product_section.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

import '../../widgets/menu_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home.title".tr)),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.r),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    HomeHeaderSection(),
                    SizedBox(height: 16.h),
                    HomeProductSection()
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
