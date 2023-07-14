import 'package:calculadora_imc/respositories/sqlite/database.dart';
import 'package:flutter/material.dart';

import 'pages/my_imc_track.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLiteDataBase.iniciarBancoDeDados();
  runApp(const MyImcTrack());
}
