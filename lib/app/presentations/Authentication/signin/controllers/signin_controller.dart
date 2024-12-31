import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xm_trades/app/data/providers/repositories/auth_repositories.dart';
import 'package:xm_trades/app/routes/app_pages.dart';

import '../../../../config/global_variables.dart';
import '../../../../config/local_data_key.dart';
import '../../../../data/providers/Models/user.dart';
import '../../../../data/providers/Models/user_model.dart';
import '../../../../data/providers/local_storage/local_db.dart';

class SigninController extends GetxController {

  TextEditingController usernameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController verificationPinController = TextEditingController();
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  AuthRepository authRepository = AuthRepository();


  UserDetails? userDetails;


  RxBool isLoading = false.obs;
  RxBool passwordVisible = false.obs;
  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  initializeData() async {
    await LocalDB().initDeviceInfo();
  }

  Future<void> signIn() async {
    isLoading.value = true;
    Map<String, dynamic>? resp;
    try {
      resp = await authRepository.signIn(
        UserRegister(
          email: usernameOrEmailController.text,
          password: passwordController.text,
        ),
      );
      if (resp != null && resp['status'] == 'success') {
        userDetails = UserDetails.fromJson(resp);
        Globals.token = resp["token"];
        Globals.fName = resp['user']['fname'];
        Globals.phoneNo = resp['user']['phoneno'];
        Globals.profileImage = resp['user']['profileimage'];
        print('.............${resp}');
        print('accessToken.........${Globals.token}');
        await LocalDB.setData(LocalDataKey.referralUserId.name, resp['user']['id']);
        await LocalDB.setData(LocalDataKey.firstName.name, resp['user']['fname']);
        await LocalDB.setData(LocalDataKey.phoneNumber.name, resp['user']['phoneno']);
        await LocalDB.setData(LocalDataKey.profileImage.name, resp['user']['profileimage']);
        await LocalDB.setData(LocalDataKey.accessToken.name, resp["token"]);
        Get.toNamed(Routes.HOME);
        isLoading.value = false;
        update();
      } else if (resp != null && resp['status'] == 0) {
        if (resp['msg'] == 'user not verified') {
          print('user not verfied');
          update();
        }
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
