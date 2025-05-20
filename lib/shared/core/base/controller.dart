import 'package:get/get.dart';

abstract class BaseController<T> extends GetxController {
  void onEvent(T event);
}