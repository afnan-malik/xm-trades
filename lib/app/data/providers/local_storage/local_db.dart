import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xm_trades/app/config/global_variables.dart';

import '../../../config/local_data_key.dart';

class LocalDB extends GetxService{
  late SharedPreferences pref;

  Future<void> onInit()async{
    await initSharedPreferences();
    initGlobals();
    await initDeviceInfo();

    super.onInit();
  }


  Future<void> initSharedPreferences()async {
    pref= await SharedPreferences.getInstance();
  }

  Future<void> initGlobals()async{
    Globals.referralUserId = pref.getInt("userId");
    Globals.token=pref.getString(LocalDataKey.accessToken.name)??"";
    print("local cache..................${Globals.token}");
    Globals.refreshToken=pref.getString("refreshToken")??"";
    Globals.isFirstTime=pref.getBool("first")?? false;
  }

  static Future<void> setData(String key, dynamic value) async {
    SharedPreferences pref = Get.find<LocalDB>().pref;

    if (value is int) {
      await pref.setInt(key, value);
    } else if (value is String) {
      await pref.setString(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  Future<void> initDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Get.log('Running on ${androidInfo.id}');
      Globals.deviceId = androidInfo.id;
      Globals.loginDevice = "Android";
      Globals.appVersion = packageInfo.version;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      Get.log('Running on ${iosInfo.identifierForVendor}');
      Globals.deviceId = iosInfo.identifierForVendor;
      Globals.loginDevice = "IOS";
      Globals.appVersion = packageInfo.version;
    }
  }
}