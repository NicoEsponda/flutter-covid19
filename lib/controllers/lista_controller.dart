import 'package:get/get.dart';
import 'package:flutter_covid19/api/info_covid_api.dart';
import 'package:flutter_covid19/models/info_covid.dart';

class ListaController extends GetxController {
  List<Country> _paises = [];
  List<Country> get paises => _paises;

  @override
  void onReady() {
    super.onReady();
    loadPaises();
  }

  Future<void> loadPaises() async {
    final data = await CovidApi.instance.getPaises();
    _paises = data;
    update(['paises']);
  }
}
