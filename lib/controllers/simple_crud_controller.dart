import 'package:get/get.dart';

class SimpleCRUDController extends GetxController {
  final _list = <String>[].obs;
  List<String> get list => _list;

  add(String n) {
    _list.add(n);
  }

  updateItem(int index, String n) {
    _list[index] = n;
  }

  deleteItem(int index) {
    _list.removeAt(index);
  }

  clearState() {
    Get.delete<SimpleCRUDController>(force: true);
  }
}
