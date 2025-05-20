import 'package:get/get.dart';

class GlobalEventController extends GetxController {
  final Rxn<AppEvent> event = Rxn<AppEvent>();

  void emit<T>(String type, {required T payload}) {
    event.value = AppEvent<T>(type, payload: payload);
  }
}

class AppEvent<T> {
  final String type;
  final T payload;

  AppEvent(this.type, {required this.payload});
}
