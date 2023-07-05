import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class MyImcTrack extends StatelessWidget {
  const MyImcTrack({super.key});



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Imc",
      home: const LoginPage(),
      theme: ThemeData(
        primaryColor: const Color(0xFFFFFFFF),
        secondaryHeaderColor: Color.fromARGB(255, 53, 192, 62),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          backgroundColor: Color.fromARGB(255, 53, 192, 62),
        ),
        appBarTheme: const AppBarTheme(elevation: 4),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.roboto(
            textStyle: textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
