import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class EcuadorScreen extends StatefulWidget {
  const EcuadorScreen({super.key});

  @override
  State<EcuadorScreen> createState() => _EcuadorScreenState();
}

class _EcuadorScreenState extends State<EcuadorScreen> {
  String ciudad_name = "";
  String link_bandera = "";
  String link_escudo = "";
  String poblacion = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final url = Uri.parse("https://restcountries.com/v3.1/name/ecuador");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Verificar que data no esté vacío
        if (data.isNotEmpty) {
          var countryData = data[0];

          // Extraer datos con verificación de null
          var flag = countryData['flags']?['png'] ?? '';
          var escudo = countryData['coatOfArms']?['png'] ?? '';
          var f = countryData['flag'] ?? '';
          var p = countryData['population'] ?? 0;

          print('Flag: $flag');
          print('Escudo: $escudo');
          print('Emoji: $f');
          print('Población: $p');

          setState(() {
            link_bandera = flag;
            link_escudo = escudo;
            poblacion = p.toString();
          });
        }
      } else {
        // Manejar error de respuesta
        print('Error: ${response.statusCode}');
        setState(() {
          link_bandera = '';
          link_escudo = '';
          poblacion = "";
        });
      }
    } catch (e) {
      // Manejar errores de red o parsing
      print('Error al obtener datos: $e');
      setState(() {
        link_bandera = '';
        link_escudo = '';
        poblacion = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hola Ecuador"),
          Text(poblacion),
          Image.network(link_bandera),
          Image.network(
            link_escudo,
            width: 150,
            height: 200,
          ),
          TextButton(
              onPressed: () {
                getData();
              },
              child: Text("Cargar"))
        ],
      ),
    );
  }
}
