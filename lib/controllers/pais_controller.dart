import 'package:get/get.dart';
import 'package:flutter_covid19/models/info_covid.dart';

class ProfileController extends GetxController {
  late Country _pais;
  Country get pais => _pais;

  @override
  void onInit() {
    super.onInit();

    _pais = Get.arguments as Country;
  }
}
