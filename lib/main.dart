// @dart=2.9
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'Screens/Homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:lone/Screens/CameraScreen.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF075E54), accentColor: Color(0xFF128C7E),
      ),
        debugShowCheckedModeBanner: false,
        home:Homescreen(),
    );

  }
}
