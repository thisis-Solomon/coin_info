import 'dart:convert';

import 'package:coin_info/models/app_config.dart';
import 'package:coin_info/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async{
  String _contentConfig = await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_contentConfig);

  GetIt.instance.registerSingleton<AppConfig>(AppConfig(COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Info!',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(210, 240, 162, 2)
      ),
      
      home: HomePage(),
    );
  }
}
