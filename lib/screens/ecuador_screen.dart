import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EcuadorScreen extends StatefulWidget {
  const EcuadorScreen({super.key});

  @override
  State<EcuadorScreen> createState() => _EcuadorScreenState();
}

class _EcuadorScreenState extends State<EcuadorScreen> {
  String ciudad_name = "";
  String link_bandera = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url = Uri.parse("https://restcountries.com/v3.1/name/ecuador");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));

      var data = jsonDecode(response.body);

      var flag = data[0]['flags']['png'];
      print(flag);

      setState(() {
        link_bandera = flag;
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
          Image.network(link_bandera),
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
