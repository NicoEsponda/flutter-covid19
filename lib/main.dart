import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_covid19/pages/global_page.dart';
import 'package:flutter_covid19/pages/home_page.dart';
import 'package:flutter_covid19/pages/lista_paises.dart';
import 'package:flutter_covid19/pages/pais_page.dart';

void main(List<String> arguments) {
  runApp(const MyApp());

  // Dio dio = Dio();
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //     (HttpClient client) {
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   return client;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Paises getx',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/listaPaises', page: () =>const ListaPaisesPage()),
        GetPage(name: '/infoGlobal', page: () => const InfoGlobalPage()),
        GetPage(name: '/pais', page: () => const PaisPage())
      ],
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
    );
  }
}

const primaryColor = Color(0xFF8E5E54);
