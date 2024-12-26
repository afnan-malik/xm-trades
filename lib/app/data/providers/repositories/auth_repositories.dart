
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Network/api_EndPoints.dart';
import '../Network/api_provider.dart';

class AuthRepository {
  late ApiProvider apiProvider;

  AuthRepository() {
    apiProvider = ApiProvider();
  }

  // Future signUp(UserRegister userRegister) async {
  //   Map<String, dynamic> data = await apiProvider.basePostAPI(
  //     APIEndPoint.signUpUrl,
  //     userRegister.toJson(),
  //     false,
  //     Get.context,
  //   );
  //   return data;
  // }

//   Future signIn(UserRegister userRegister) async {
//     Map<String, dynamic> data = await apiProvider.basePostAPI(
//       APIEndPoint.loginUrl,
//       {
//         "phoneno": userRegister.email,
//         "password": userRegister.password,
//       },
//       false,
//       Get.context,
//     );
//     return data;
//   }
 }