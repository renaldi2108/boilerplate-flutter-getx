import 'package:boilerplate/presentation/user/controller/user_controller.dart';
import 'package:boilerplate/shared/core/di/di.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => getIt<UserController>());
  }
}