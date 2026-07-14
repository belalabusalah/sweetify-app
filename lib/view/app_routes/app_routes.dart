import 'package:AURA/view/app_routes/route_paths.dart';
import 'package:AURA/view/screens/about_us_screen.dart';
import 'package:AURA/view/screens/address_form_screen.dart';
import 'package:AURA/view/screens/address_screen.dart';
import 'package:AURA/view/screens/auth_screens/reset_password_screen.dart';
import 'package:AURA/view/screens/auth_screens/verify_otp_screen.dart';
import 'package:AURA/view/screens/cart_screen/cart_screen.dart';
import 'package:AURA/view/screens/detils_screen.dart';
import 'package:AURA/view/screens/auth_screens/forget_password_screen.dart';
import 'package:AURA/view/screens/main_screen.dart';
import 'package:AURA/view/screens/payment_card.dart';
import 'package:AURA/view/screens/privacy_policy_screen.dart';
import 'package:AURA/view/screens/profile_screen/profile_screen.dart';
import 'package:AURA/view/screens/shopping_screen.dart';
import 'package:AURA/view/screens/support_screen.dart';
import 'package:AURA/view/screens/terms_screen.dart';
import 'package:AURA/view/screens/wish_list_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../screens/auth_screens/determine_entry_screen.dart';
import '../screens/auth_screens/sign_in_screen.dart';
import '../screens/auth_screens/sign_up_screen.dart';
import '../screens/auth_screens/splash_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/sheckout_screen.dart';

class AppRoutes {
  AppRoutes._();

  static  List<GetPage> pages=[
    GetPage(name: RoutePaths.splashScreen, page: () => SplashScreen()),
    GetPage(name: RoutePaths.determineEntryScreen,page: () => DetermineEntryScreen(),),
    GetPage(name: RoutePaths.signInScreen, page: () => SignInScreen()),
    GetPage(name: RoutePaths.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: RoutePaths.homeScreen, page: () => HomeScreen()),
    GetPage(name: RoutePaths.profileScreen, page: () => ProfileScreen()),
    GetPage(name: RoutePaths.aboutUsScreen, page: () => AboutUsScreen()),
    GetPage(name: RoutePaths.privacyPolicyScreen,page: () => PrivacyPolicyScreen(),),
    GetPage(name: RoutePaths.termsConditionsScreen,page: () => TermsConditionsScreen(),),
    GetPage(name: RoutePaths.supportScreen, page: () => SupportScreen()),
    GetPage(name: RoutePaths.addressScreen, page: () => const AddressScreen()),
    GetPage(name: RoutePaths.addressFormScreen,page: () => const AddressFormScreen(),),
    GetPage(name: RoutePaths.wishListScreen, page: () => WishListScreen()),
    GetPage(name: RoutePaths.paymentScreen, page: () => PaymentScreen()),
    GetPage(name: RoutePaths.detailsScreen, page: () => DetailsScreen()),
    GetPage(name: RoutePaths.cardScreen, page: () => CartScreen()),
    GetPage(name: RoutePaths.mainScreen, page: () => MainScreen()),
    GetPage(name: RoutePaths.shoppingScreen, page: () => ShoppingScreen()),
    GetPage(name: RoutePaths.checkoutScreen, page: () => CheckoutScreen()),
    GetPage(name: RoutePaths.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: RoutePaths.verifyOtpScreen, page: () => VerifyOtpScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
      curve: Curves.slowMiddle,
    ),
    GetPage(name: RoutePaths.resetPasswordScreen, page: () => ResetPasswordScreen()),

  ];
}