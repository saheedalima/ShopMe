
import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/IntroductionScreen/IntroductionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'Firebase/Registration.dart';
import 'Provider/data_provider.dart';
import 'View/HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(ChangeNotifierProvider(
    create: (context)=>dataProvider(),
    child: GetMaterialApp(
          useInheritedMediaQuery: true,
      home: splash(),
          debugShowCheckedModeBanner: false,
        )
    ));
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
          (context) => user == null ? onboarding() :  HomeApi()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            child: Lottie.asset("assets/animations/animation_ll73xktl.json",fit: BoxFit.fill)),
      ),
    );
  }
}
