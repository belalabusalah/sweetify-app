import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),

          // width: 160.w,
          // height: 230.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                color: Colors.black12,
                blurRadius: 3,
              ),
              BoxShadow(
                offset: Offset(-5, -5),
                color: Colors.black12,
                blurRadius: 3,
              ),
              BoxShadow(
                offset: Offset(5, -5),
                color: Colors.black12,
                blurRadius: 3,
              ),
              BoxShadow(
                offset: Offset(-5, 5),
                color: Colors.white12,
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    height: 100.h,
                    width: 160.w,
                    fit: BoxFit.cover,
                    "images/home_screen_images/imageHome.jpg",
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Container(
                      height: 30.h,
                      width: 37.w,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: Container(
                      height: 30.h,
                      width: 37.w,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart_outlined, color: Colors.red),
                        onPressed: () {},
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption(
                      "golden LEGO cube golden LEGO cube golden LEGO cube golden LEGO cube golden LEGO cube golden LEGO cube",
                      maxLines: 3,
                    ),
                    AppText.subtitle("\$120.00"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
