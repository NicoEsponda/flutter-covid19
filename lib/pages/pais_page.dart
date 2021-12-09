import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_covid19/controllers/pais_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class PaisPage extends StatelessWidget {
  const PaisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.arguments();
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        'https://flagcdn.com/w640/${_.pais.countryCode.toLowerCase()}.jpg',
                  ),
                  const SizedBox(height: 60),
                  Text(
                    _.pais.country,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    _.pais.countryCode,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Text('\nTotal\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Confirmados'),
                      Text('Muertos'),
                      Text('Recuperados'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _.pais.totalConfirmed.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        _.pais.totalDeaths.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        _.pais.totalRecovered.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const Text('\nNuevos\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Confirmados'),
                      Text('Muertos'),
                      Text('Recuperados'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _.pais.newConfirmed.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        _.pais.newDeaths.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        _.pais.newRecovered.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  const Text('\nFecha'),
                  Text(
                    _.pais.date.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
