import 'package:flutter/material.dart';
import 'package:sistemas/themes/colors_list.dart';

class ListSisWidget extends StatelessWidget {
  const ListSisWidget({Key? key}) : super(key: key);

  // ignore: unused_field
  final double _listPadding = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(
            left: _listPadding, right: _listPadding, top: _listPadding),
        shrinkWrap: true,
        itemCount: _Sys.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: _sisIfo(index),
                ),
              ],
            ),
          );
        });
  }

  Widget _sisIfo(int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: ColorList.card,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.laptop,
                color: ColorList.backgroundButton,
                size: 28.0,
              ),
              Text(
                _Sys[index].name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: ColorList.backgroundButton,
                ),
              ),
            ],
          ),
          Text(
            _Sys[index].descripcion,
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            'Situacion: ${_Sys[index].situacion} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            'Servidor: ${_Sys[index].servidor} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            'Lenguaje: ${_Sys[index].lenguaje} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Base: ${_Sys[index].base} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Dominio: ${_Sys[index].dominio} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Path: ${_Sys[index].path} ',
            style: const TextStyle(
              color: ColorList.descriptionText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ModelSys {
  final String name;
  final String descripcion;
  final String situacion;
  final String servidor;
  final String lenguaje;
  final String base;
  final String dominio;
  final String path;
  final String image;

  ModelSys(
      {required this.name,
      required this.descripcion,
      required this.situacion,
      required this.servidor,
      required this.lenguaje,
      required this.base,
      required this.dominio,
      required this.path,
      required this.image});
}

/// Contiene la lista con la informacion de los sistemas.
// ignore: non_constant_identifier_names
List<ModelSys> _Sys = [
  ModelSys(
    name: '  Kardex',
    descripcion: 'Sistema de administracion policial',
    situacion: 'Produccion',
    servidor: '10.13.9.249',
    lenguaje: 'Vue',
    base: 'PostgresSQL',
    dominio: 'http://sap.ssc.cdmx.gob.mx/',
    path: '/local',
    image: '',
  ),
];
