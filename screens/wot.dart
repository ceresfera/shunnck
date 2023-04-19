import 'package:flutter/material.dart';
import 'ajustes.dart';
import 'nybox.dart';
import 'instante.dart';

class WotScreen extends StatefulWidget {
  const WotScreen({Key? key}) : super(key: key);

  @override
  State<WotScreen> createState() => _WotScreenState();
}

class _WotScreenState extends State<WotScreen> {
  get ventanas => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NyboxView(
                    url: '',
                  ),
                ),
              );
            },
            onLongPress: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ajustesScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/images/icono_ints_central.png",
              height: 22,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: const InstanteViews(),
    );
  }
}
