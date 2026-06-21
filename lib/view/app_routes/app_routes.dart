import 'package:AURA/view/app_routes/route_paths.dart';
import 'package:AURA/view/screens/about_us_screen.dart';
import 'package:AURA/view/screens/address_form_screen.dart';
import 'package:AURA/view/screens/address_screen.dart';
import 'package:AURA/view/screens/cart_screen/cart_screen.dart';
import 'package:AURA/view/screens/detils_screen.dart';
import 'package:AURA/view/screens/main_screen.dart';
import 'package:AURA/view/screens/payment_card.dart';
import 'package:AURA/view/screens/privacy_policy_screen.dart';
import 'package:AURA/view/screens/profile_screen/profile_screen.dart';
import 'package:AURA/view/screens/shopping_screen.dart';
import 'package:AURA/view/screens/support_screen.dart';
import 'package:AURA/view/screens/terms_screen.dart';
import 'package:AURA/view/screens/wish_list_screen.dart';
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
    GetPage(name: "/determineEntryScreen",page: () => DetermineEntryScreen(),),
    GetPage(name: "/signInScreen", page: () => SignInScreen()),
    GetPage(name: "/signUpScreen", page: () => SignUpScreen()),
    GetPage(name: "/homeScreen", page: () => HomeScreen()),
    GetPage(name: "/profileScreen", page: () => ProfileScreen()),
    GetPage(name: "/aboutUsScreen", page: () => AboutUsScreen()),
    GetPage(name: "/privacyPolicyScreen",page: () => PrivacyPolicyScreen(),),
    GetPage(name: "/termsConditionsScreen",page: () => TermsConditionsScreen(),),
    GetPage(name: "/supportScreen", page: () => SupportScreen()),
    GetPage(name: "/addressScreen", page: () => const AddressScreen()),
    GetPage(name: "/addressFormScreen",page: () => const AddressFormScreen(),),
    GetPage(name: "/wishListScreen", page: () => WishListScreen()),
    GetPage(name: "/paymentScreen", page: () => PaymentScreen()),
    GetPage(name: "/detailsScreen", page: () => DetailsScreen()),
    GetPage(name: "/cardScreen", page: () => CartScreen()),
    GetPage(name: "/mainScreen", page: () => MainScreen()),
    GetPage(name: "/shoppingScreen", page: () => ShoppingScreen()),
    GetPage(name: "/checkoutScreen", page: () => CheckoutScreen()),
  ];
}