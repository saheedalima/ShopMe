import 'package:e_commerce/View/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../Firebase/Login.dart';
import '../Firebase/Registration.dart';

class onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    PageDecoration pageDecoration=const PageDecoration(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "Shop products",
              body: "You can easily purchase all products in Shop Me..",
              image: introimage("assets/animation/animation_ll73xktl.json"),
            ),
            PageViewModel(
              title: "Create cart page ",
              body: "In Shop Me.. you can add your favorite products to your cart page",
              image: introimage("assets/animation/animation_llb8xhyq.json"),
            ),
            PageViewModel(
              title: "Enjoy your  shopping...",
              body: "Enjoy better shopping experience with us and continue your shopping..",
              image: introimage("assets/animation/animation_llb91htg.json"),
            )
          ],
          onSkip: ()=>
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
                  login())),
          skip: Text("Skip"),
          showSkipButton: true,
          next: Text("Next"),
          onDone: ()=>
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
              login())),
          done: Text("Done"),
          dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              activeSize: Size(15, 15),
              activeColor: Colors.yellow,
              color: Colors.grey,
              shape: CircleBorder(
              )
          ),
        ),
      ),
    );
  }

  Widget introimage(String image) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Container(
            height: 500,
            width: 300,
            child: Lottie.asset(image,fit: BoxFit.fill)),
      ),
    );
  }
}


