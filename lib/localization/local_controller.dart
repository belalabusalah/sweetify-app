import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AURA/%20services/settings_services.dart';





class MyLocalController extends GetxController {
  final SettingsServices settings = Get.find();
  final Rx<Locale> locale =(Get.deviceLocale??const Locale('en')).obs;

  @override
  void onInit(){
    super.onInit();
    final savedLang = settings.getLang();
    locale.value = savedLang == null
        ? Get.deviceLocale ?? const Locale('en')
        : Locale(savedLang);
    Get.updateLocale(locale.value);
  }

  // void changeLang(String codelang) {
  //   Locale newLocale = Locale(codelang);
  //   settings.saveLang(codelang);
  //   Get.updateLocale(newLocale);
  // }
  void changeLang(String code) {
    final newLocale = Locale(code);

    locale.value = newLocale;

    settings.saveLang(code);

    Get.updateLocale(newLocale);
  }

  void toggleLang() {
    if (locale.value.languageCode == 'ar') {
      changeLang("en");
    } else {
      changeLang("ar");
    }
  }
}


/*class MyLocalController extends GetxController {
  final SharedPreferences prefs;

  MyLocalController(this.prefs);

  final Rx<Locale> locale = const Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    _loadLang();
  }

  void _loadLang() {
    final lang = prefs.getString("lang");

    if (lang == null) {
      locale.value = Get.deviceLocale ?? const Locale('en');
    } else {
      locale.value = Locale(lang);
    }

    Get.updateLocale(locale.value);
  }

  void changeLang(String code) {
    final newLocale = Locale(code);

    locale.value = newLocale;
    prefs.setString("lang", code);

    Get.updateLocale(newLocale);
  }

  void toggleLang() {
    changeLang(locale.value.languageCode == 'ar' ? 'en' : 'ar');
  }
}*/