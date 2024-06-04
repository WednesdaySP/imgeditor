import 'package:get/get.dart';

class DialogController extends GetxController {
  var shape = ''.obs;

  void setShape(String? newShape) {
    shape.value = newShape ?? '';
    print('Shape set to: $shape');
  }
}
