// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_covid19/controllers/lista_controller.dart';
import 'package:flutter_covid19/main.dart';
import 'package:flutter_covid19/models/info_covid.dart';
import 'package:octo_image/octo_image.dart';
import 'package:animate_do/animate_do.dart';

class ListaPaisesPage extends StatelessWidget {
  const ListaPaisesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListaController>(
      id: 'paises',
      init: ListaController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                _CustomAppBar(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final List<Country> p = _.paises;
                      final Country pais = p[index];
                      var numero = index + 1;
                 
                      p.sort((a, b) =>
                          b.totalConfirmed.compareTo(a.totalConfirmed));

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: FadeInLeft(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFDDDBDB),
                                      Color(0xFFC9D7D7),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                    offset: Offset(0, 5),
                                  )
                                ]),
                            child: _DisenoListTile(numero: numero, pais: pais),
                          ),
                        ),
                      );
                    },
                    childCount: _.paises.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DisenoListTile extends StatelessWidget {
  const _DisenoListTile({
    Key? key,
    required this.numero,
    required this.pais,
  }) : super(key: key);

  final int numero;
  final Country pais;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 269 / 173,
        child: OctoImage(
          image: NetworkImage(
              'https://flagcdn.com/w80/${pais.countryCode.toLowerCase()}.png'),
          placeholderBuilder: OctoPlaceholder.blurHash(
            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
          ),
          errorBuilder: OctoError.icon(color: Colors.red),
          fit: BoxFit.cover,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            Text(
              '#${numero.toString()}',
              style: TextStyle(color: Colors.deepOrange[300], fontSize: 25),
            ),
            Text(
              pais.country,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('Confirmados: ${pais.totalConfirmed}')
          ],
        ),
      ),
      onTap: () => Get.toNamed('/pais', arguments: pais),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('assets/covid.jpg', fit: BoxFit.cover),
        centerTitle: true,
        title: Text(
          'Lista Paises',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: primaryColor,
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: 150,
      elevation: 0,
      shape: RoundedRectangleBorder(),
    );
  }
}
