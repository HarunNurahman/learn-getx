import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/pages/counter_app.dart';
import 'package:flutter_learn_getx/pages/counter_app_setstate.dart';
import 'package:flutter_learn_getx/pages/realtime_input_app.dart';
import 'package:flutter_learn_getx/pages/simple_crud.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => const CounterApp());
            },
            child: const Text('Counter App'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const CounterAppSetState());
            },
            child: const Text('Counter App SetState'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const RealtimeInputApp());
            },
            child: const Text('Realtime Input App'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SimpleCRUD());
            },
            child: const Text('Simple CRUD App'),
          ),
        ],
      ),
    );
  }
}
