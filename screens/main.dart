import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'wot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: const WotScreen(),
      theme: ThemeData(
        fontFamily: 'LeaugeSpartanLite',
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0XFF282828),
          elevation: 8,
        ),
      ),
    );
  }
}
