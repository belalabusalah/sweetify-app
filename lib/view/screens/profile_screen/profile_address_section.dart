import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Address",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        // Address Card
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.h),
              Text("kweet, hghghg, Block kweet, Building 55"),
              SizedBox(height: 6.h),
              Text("📱 626289262"),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        // Manage Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextButton(
            onPressed: () {
              // TODO: Navigate to addresses screen
            },
            child: const Text("Manage Addresses"),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}