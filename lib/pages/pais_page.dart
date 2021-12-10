import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_covid19/controllers/pais_controller.dart';
import 'package:octo_image/octo_image.dart';

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
                  AspectRatio(
                    aspectRatio: 269 / 173,
                    child: OctoImage(
                      image: NetworkImage(
                          'https://flagcdn.com/w640/${_.pais.countryCode.toLowerCase()}.jpg'),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                      ),
                      errorBuilder: OctoError.icon(color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    _.pais.country,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
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
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        _.pais.totalDeaths.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.left,
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
