import 'package:get/get.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      // =============== splash ===============
      "splash.title": "ابدأ في الراحة",
      "splash.subtitle": "اكتشف الأناقة المريحة. تسوق الآن!",
      "splash.get_comfy": "ابدأ الآن",

      // =============== auth ===============
      "auth.age_notice":
          "يجب أن يكون عمرك 18 عامًا أو أكثر لتقديم طلب، للعملاء من 13 إلى 17 عامًا يرجى الحصول على موافقة أحد الوالدين أو الوصي.",
      "auth.login": "تسجيل الدخول",
      "auth.create_account": "إنشاء حساب",
      "auth.create_account_title": "إنشاء حساب جديد",
      "auth.skip": "تخطى الآن",
      "auth.brand_name": "أوتوم شيك",
      "auth.username_or_email": "اسم المستخدم أو البريد الإلكتروني",
      "auth.password": "كلمة المرور",
      "auth.forgot_password": "نسيت كلمة المرور؟",
      "auth.or_continue_with": "أو المتابعة بواسطة",
      "auth.create_an_account": "إنشاء حساب جديد",
      "auth.sign_up": "التسجيل",
      "auth.first_name": "الاسم الأول",
      "auth.last_name": "اسم العائلة",
      "auth.phone": "رقم الهاتف",
      "auth.confirm_password": "تأكيد كلمة المرور",
      "auth.by_clicking": "بالنقر على زر ",
      "auth.button_you_agree": "، فإنك توافق ",
      "auth.to_public_offer": " على العرض العام",
      "auth.already_have_account": "لدي حساب بالفعل",
      "auth.sign_in": "تسجيل الدخول",

      // =============== home ===============
      "home.title": "الشاشة الرئيسية",

      // =============== profile ===============
      "profile.title": "الملف الشخصي",
      "profile.user_info": "معلومات المستخدم",
      "profile.phone": "الهاتف",
      "profile.username": "اسم المستخدم",
      "profile.gender": "الجنس",
      "profile.not_set": "غير محدد",
      "profile.address": "العنوان",
      "profile.shipping_address": "عنوان الشحن",
      "profile.manage_addresses": "إدارة العناوين",
      "profile.settings": "الإعدادات",
      "profile.theme": "المظهر",
      "profile.change_theme": "تغيير مظهر التطبيق",
      "profile.language": "اللغة",
      "profile.lang_options": "عربي / إنجليزي",
      "profile.more": "المزيد",
      "profile.logout": "تسجيل الخروج",
      "profile.delete_account": "حذف الحساب",
      "profile.no_data": "لا توجد بيانات للملف الشخصي",

      // =============== more ===============
      "more.about_us": "من نحن",
      "more.privacy_policy": "سياسة الخصوصية",
      "more.terms": "الشروط والأحكام",

      // =============== common ===============
      "common.no_data": "لا توجد بيانات",
      "common.no_data_found": "لم يتم العثور على بيانات",

      // =============== support ===============
      "support": "الدعم الفني",
      "support.title": "الدعم",
      "support.headline": "نحن هنا للمساعدة 👋",
      "support.subtitle": "أرسل مشكلتك وسنرد عليك قريبًا.",
      "support.subject_hint": "الموضوع",
      "support.message_hint": "اكتب رسالتك...",
      "support.send_ticket": "إرسال التذكرة",
      "support.sending": "جاري الإرسال...",

    },
    "en": {
      // =============== splash ===============
      "splash.title": "Snuggle Into Comfort",
      "splash.subtitle": "Discover Cozy Elegance. Shop Now!",
      "splash.get_comfy": "Get Comfy",

      // =============== auth ===============
      "auth.age_notice":
          "You must be 18 or above to place an order, for customers aged 13-17 please ask a parent or guardian for consent.",
      "auth.login": "Login",
      "auth.create_account": "Create Account",
      "auth.create_account_title": "Create an Account",
      "auth.skip": "Skip for Now",
      "auth.brand_name": "Autumn Chick",
      "auth.username_or_email": "Username or Email",
      "auth.password": "Password",
      "auth.forgot_password": "Forgot Password?",
      "auth.or_continue_with": "Or Continue With",
      "auth.create_an_account": "Create An Account",
      "auth.sign_up": "Sign Up",
      "auth.first_name": "first name",
      "auth.last_name": "last name",
      "auth.phone": "phone",
      "auth.confirm_password": "Confirm Password",
      "auth.by_clicking": "By clicking the  ",
      "auth.button_you_agree": "button, you agree ",
      "auth.to_public_offer": " to the public offer",
      "auth.already_have_account": "I Already Have an Account",
      "auth.sign_in": "Sign In",

      // =============== home ===============
      "home.title": "home screen",

      // =============== profile ===============
      "profile.title": "Profile",
      "profile.user_info": "User Info",
      "profile.phone": "Phone",
      "profile.username": "Username",
      "profile.gender": "Gender",
      "profile.not_set": "Not set",
      "profile.address": "Address",
      "profile.shipping_address": "Shipping address",
      "profile.manage_addresses": "Manage Addresses",
      "profile.settings": "Settings",
      "profile.theme": "Theme",
      "profile.change_theme": "Change app theme",
      "profile.language": "Language",
      "profile.lang_options": "English / Arabic",
      "profile.more": "More",
      "profile.logout": "Logout",
      "profile.delete_account": "Delete Account",
      "profile.no_data": "No profile data",

      // =============== more ===============
      "more.about_us": "About Us",
      "more.privacy_policy": "Privacy Policy",
      "more.terms": "Terms & Conditions",

      // =============== common ===============
      "common.no_data": "No Data",
      "common.no_data_found": "No Data Found",

      // =============== support ===============
      "support": "Technical support",
      "support.title": "Support",
      "support.headline": "We're here to help 👋",
      "support.subtitle": "Send your issue and we will respond soon.",
      "support.subject_hint": "Subject",
      "support.message_hint": "Write your message...",
      "support.send_ticket": "Send Ticket",
      "support.sending": "Sending...",

    },
  };
}
