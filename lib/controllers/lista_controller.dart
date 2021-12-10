import 'package:get/get.dart';
import 'package:flutter_covid19/api/info_covid_api.dart';
import 'package:flutter_covid19/models/info_covid.dart';

class ListaController extends GetxController {
  List<Country> _paises = [];
  List<Country> get paises => _paises;

  var isLoading = false;

  String dato = '';

  @override
  void onReady() {
    super.onReady();
    loadPaises();
  }

  Future<void> fetchData() async {
    isLoading = true;
    update(); // triggers the GetBuilder rebuild
    await Future.delayed(
      const Duration(seconds: 2),
      () => dato = 'Data Loaded',
    );
    isLoading = false;
    update();
  }

  Future<void> loadPaises() async {
    final data = await CovidApi.instance.getPaises();
    _paises = data;
    update(['paises']);
  }
}
