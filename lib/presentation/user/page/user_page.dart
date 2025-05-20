import 'dart:convert';

import 'package:boilerplate/presentation/user/controller/user_controller.dart';
import 'package:boilerplate/shared/core/controller/global_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // TODO: USING GLOBAL CONTROLLER
    // Get.find<GlobalEventController>().emit("haii", payload: 1); // TODO: SEND DATA
    // ever<AppEvent?>(Get.find<GlobalEventController>().event, (event) {
    //   if(event?.type == "haii") {
    //     print("appEvent.haii: ${event!.payload}");
    //   }
    // }); // TODO: LISTEN EVENT FROM GLOBAL CONTROLLER
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx((){
              var result = Get.find<UserController>().userState.value.maybeWhen(
                  success: (data) => jsonEncode(data),
                  loading: () => "loading",
                  error: (message) => message,
                  orElse: () => "initial"
              );

              return Text(
                result,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 10
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.find<UserController>().onEvent(UserEvent.fetchUser());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}