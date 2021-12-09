import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_covid19/main.dart';

class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;

    final ButtonStyle styleB = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 30),
        primary: primaryColor,
        padding: EdgeInsets.all(_w / 25),
        elevation: 10,
        minimumSize: const Size(300, 80));

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('infoGlobal'),
              child: const Text('Informacion global'),
              style: styleB,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.toNamed('listaPaises'),
              child: const Text('Lista Paises'),
              style: styleB,
            ),
          ],
        )),
      ),
    );
  }
}
