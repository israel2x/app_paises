import 'package:flutter/material.dart';
import 'package:paises_app/screens/ecuador_screen.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: TextButton(
              child: Text("Ecuador"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EcuadorScreen()));
              },
            )),
            Expanded(child: TextButton(onPressed: () {}, child: Text("Peru"))),
            Expanded(
                child: TextButton(onPressed: () {}, child: Text("Colombia"))),
          ],
        ),
      ),
    );
  }
}
