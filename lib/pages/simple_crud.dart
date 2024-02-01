import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/simple_crud_controller.dart';
import 'package:get/get.dart';

class SimpleCRUD extends StatefulWidget {
  const SimpleCRUD({super.key});

  @override
  State<SimpleCRUD> createState() => _SimpleCRUDState();
}

class _SimpleCRUDState extends State<SimpleCRUD> {
  final simpleCRUDController = Get.put(SimpleCRUDController());

  addView() {
    final edtInput = TextEditingController();

    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: edtInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.add(edtInput.text);
                Navigator.pop(context);
                DInfo.snackBarSuccess(context, 'Add Success');
              },
              child: const Text('Add'),
            ),
          )
        ],
      ),
    );
  }

  updateView(String oldData, int index) {
    final edtInput = TextEditingController();
    edtInput.text = oldData;

    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: edtInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.updateItem(index, edtInput.text);
                Navigator.pop(context);
                DInfo.snackBarSuccess(context, 'Add Success');
              },
              child: const Text('Update'),
            ),
          ),
        ],
      ),
    );
  }

  deleteView(String oldData, int index) async {
    DInfo.dialogConfirmation(
      context,
      'Delete',
      'Are you sure want to delete $oldData?',
    ).then((delete) {
      if (delete ?? false) {
        simpleCRUDController.deleteItem(index);
      }
    });
  }

  @override
  void dispose() {
    simpleCRUDController.clearState();
    super.dispose();
  }

  // List list = ['Pokekmon', 'Sare Padang', 'Borgir'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple CRUD'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              addView();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: GetX<SimpleCRUDController>(
        init: SimpleCRUDController(),
        builder: (controller) {
          List<String> list = controller.list;
          if (list.isEmpty) {
            return const Center(child: Text('No Data'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              String item = list[index];
              return ListTile(
                leading: IconButton.filled(
                  onPressed: () => updateView(item, index),
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                ),
                title: Text(item),
                trailing: IconButton.filled(
                  onPressed: () => deleteView(item, index),
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
