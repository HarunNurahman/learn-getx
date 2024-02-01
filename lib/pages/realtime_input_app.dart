import 'package:d_input/d_input.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealtimeInputApp extends StatefulWidget {
  const RealtimeInputApp({super.key});

  @override
  State<RealtimeInputApp> createState() => _RealtimeInputAppState();
}

class _RealtimeInputAppState extends State<RealtimeInputApp> {
  final inputController = Get.put(RealtimeInputController());

  @override
  void initState() {
    DMethod.printBasic('initState() - RealtimeInputApp');
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RealtimeInputController>(force: true);
    DMethod.printBasic('dispose() - RealtimeInputApp');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DMethod.printBasic('build() - RealtimeInputApp');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Input'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DInput(
            controller: TextEditingController(),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            radius: BorderRadius.circular(30),
            onChanged: (value) {
              inputController.textInput = value!;
            },
          ),
          const SizedBox(height: 20),
          Obx(
            () => Text(
              inputController.textInput,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}

class RealtimeInputController extends GetxController {
  final _textInput = '-'.obs;
  String get textInput => _textInput.value;
  set textInput(String n) => _textInput.value = n;
}
