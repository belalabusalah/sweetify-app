import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sweetify_app/controller/auth_controler/sign_in_controller.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_form_faild_app_custom.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SignInController _controllerLogin = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sign in")),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage("images/Welcome Back!.png")),
              SizedBox(height: 40.h),
              CustomTextFormField(
                controller: _controllerLogin.userNameController,
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "Username or Email",
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: _controllerLogin.passwordController,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "Password",
                suffixIcon: Icon(
                  Icons.visibility_outlined,
                  color: Color(0xFF8C8C90),
                  size: 24.r,
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: AppText.body(
                    "Forgot Password?",
                    color: Color(0xFFA99577),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Obx(() {
                return _controllerLogin.isLoading.value
                    ? CircularProgressIndicator()
                    : CustomElevatedButton(
                        text: 'Login',
                        onPressed: () {
                          _controllerLogin.login();
                        },
                        color: Color(0xFF483028),
                      );
              }),
              SizedBox(height: 60.h),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      "Or Continue With ",
                      style: TextStyle(fontSize: 12, color: Color(0xFFA99577)),
                    ),
                  ),

                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  InkWell(
                    child: Image(
                      image: AssetImage("images/auth_images/google.png"),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  InkWell(
                    child: Image(
                      image: AssetImage("images/auth_images/apple.png"),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  InkWell(
                    child: Image(
                      image: AssetImage("images/auth_images/faceboock.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.caption(
                    "Create An Account",
                    color: Color(0xFFA99577),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: AppText.caption("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
