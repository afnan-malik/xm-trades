import 'package:get/get.dart';

import '../controllers/with_draw_controller.dart';

class WithDrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithDrawController>(
      () => WithDrawController(),
    );
  }
}
