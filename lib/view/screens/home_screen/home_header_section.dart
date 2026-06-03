import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sweetify_app/controller/screens_controller/home_controller.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class HomeHeaderSection extends StatelessWidget {
  HomeHeaderSection({super.key});
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 510.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 143.h,
            decoration: BoxDecoration(color: Colors.grey),
            child: PageView.builder(
              controller: _homeController.pageController,
              itemCount: _homeController.images.length,
              itemBuilder: (context, index) {
                return Image(
                  image: AssetImage(_homeController.images[index]),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          SmoothPageIndicator(
            controller: _homeController.pageController,
            count: _homeController.images.length,
            effect: ExpandingDotsEffect(
              dotWidth: 8.w,
              dotHeight: 8.h,
              activeDotColor: Color(0xFF483028),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
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

                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'search any product..',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD5D0CB),
                        // overflow: Text,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, color: Color(0xFFD5D0CB)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
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
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_sharp, color: Color(0xFF483028)),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              AppText.body(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                "All Featured",
              ),
              SizedBox(width: 42.w),
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
                    text: 'Sort',
                    height: 25.h,
                    fontSizeText: 8.sp,
                    iconSize: 14.r,
                    icon: Icons.sort_rounded,
                    textColor: Color(0xFF572717),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(width: 12.w),
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
                    text: 'Filter',
                    fontSizeText: 8.sp,
                    height: 25.h,
                    iconSize: 14.r,
                    icon: Icons.filter_alt_outlined,
                    textColor: Color(0xFF572717),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Image(
            fit: BoxFit.cover,
            height: 230,
              width: double.infinity,
              image: AssetImage('images/home_screen_images/imageHome.jpg')),
        ],
      ),
    );
  }
}
