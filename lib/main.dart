import 'package:boilerplate/shared/core/di/di.dart';
import 'package:boilerplate/shared/core/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shared/core/controller/global_event_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDepedencies();

  Get.put(GlobalEventController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutePath.homeScreen,
      getPages: RouteHelper.routes,
    );
  }
}