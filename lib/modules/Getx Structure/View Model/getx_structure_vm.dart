import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class StrutureViewModel extends GetxController {
  RxDouble sumValues = 0.0.obs;
  RxDouble firstValues = 0.0.obs;
  RxDouble secondValues = 0.0.obs;

  void calculeteValues(String sign) {
    if (sign == '+') {
      sumValues.value = firstValues.value + secondValues.value;
    } else if (sign == '-') {
      sumValues.value = firstValues.value - secondValues.value;
    } else if (sign == '*') {
      sumValues.value = firstValues.value * secondValues.value;
    } else if (sign == '/') {
      sumValues.value = firstValues.value / secondValues.value;
    }
    sumValues.refresh();
  }
}
