import 'package:flutter/material.dart';
import 'package:flutter_provider_restapi/provider/homeScreenProvider.dart';
import 'package:flutter_provider_restapi/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ChangeNotifierProvider<HomeScreenProvider> (
        create: (context) => HomeScreenProvider(),
        child: const HomeScreen(),
        
      ),
    );
  }
}




