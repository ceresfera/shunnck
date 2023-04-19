// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'wot.dart';

class ajustesScreen extends StatelessWidget {
  const ajustesScreen({Key? key}) : super(key: key);

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
                  builder: (context) => const WotScreen(),
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
      body: Center(
        child: Expanded(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Image(
                  image: AssetImage("assets/images/ajustes_banner.png"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Manatí",
                  style: TextStyle(
                    color: Color(0XFFF8F8F8),
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "Versión 0.1",
                  style: TextStyle(
                    color: Color(0XFFCACACA),
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
