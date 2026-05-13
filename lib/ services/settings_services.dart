

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService{
 late  SharedPreferences? sharedprefe;
Future <SettingsServices> initSharedPreferences()async{

  sharedprefe =  await SharedPreferences.getInstance();
  return this;
}
}