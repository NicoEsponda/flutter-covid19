// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_covid19/models/info_covid.dart';

class InfoGlobalPage extends StatelessWidget {
  const InfoGlobalPage({Key? key}) : super(key: key);

  Future<InfoCovid> getGlobal() async {
    final res = await http.get(Uri.parse('https://api.covid19api.com/summary'));
    return infoCovidFromJson(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: getGlobal(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _InfoMundial(snapshot.data);
          }
        },
      )),
    );
  }
}

class _InfoMundial extends StatelessWidget {
  final InfoCovid info;

  const _InfoMundial(this.info);

  @override
  Widget build(BuildContext context) {
    print(info.global);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Mundial',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Text('\nTotal\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Confirmados'),
                  Text('Muertos'),
                  Text('Recuperados'),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      info.global.totalConfirmed.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      info.global.totalDeaths.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      info.global.totalRecovered.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Text('\n\nNuevos\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                    info.global.newConfirmed.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    info.global.newDeaths.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    info.global.newRecovered.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
