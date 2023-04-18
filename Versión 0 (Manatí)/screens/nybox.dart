import 'package:flutter/material.dart';
import 'package:nyboxview.dart';

class NyboxView extends StatefulWidget {
  const NyboxView({Key? key, required String url}) : super(key: key);

  @override
  State<NyboxView> createState() => _NyboxViewState();
}

class _NyboxViewState extends State<NyboxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Center(
          child: Image.asset(
            "assets/images/icono_nybox_central.png",
            height: 38,
          ),
        ),
        elevation: 0,
      ),
      body: const NyBoxPlasma(),
    );
  }
}
