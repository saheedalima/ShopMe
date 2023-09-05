import 'package:e_commerce/Firebase/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../View/HomePage.dart';
import 'FirebaseHelper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: RegistrationFire()));
}

class RegistrationFire extends StatefulWidget {
  const RegistrationFire({super.key});

  @override
  State<RegistrationFire> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<RegistrationFire> {
  final username_controller=TextEditingController();
  final password_controller=TextEditingController();
  final email_controller=TextEditingController();
  final confirm_pass_controller=TextEditingController();

  bool showpass=true;
  bool showpass1=true;
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            ""))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Sign up here",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 50, right: 50),
                              child: TextFormField(
                                controller: email_controller,
                                validator: (email) {
                                  if (email!.isEmpty || !email.contains("@") ||
                                      !email.contains(".")) {
                                    return "enter valid email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "Enter your email",
                                  labelText: "email",
                                  prefixIcon: Icon(Icons.email),
                                  suffixIcon: Icon(Icons.email),
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 50, right: 50),
                              child: TextFormField(
                                controller: username_controller,
                                validator: (username) {
                                  if (username!.isEmpty) {
                                    return "field could not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "Enter your username",
                                  labelText: "username",
                                  prefixIcon: Icon(Icons.supervised_user_circle),
                                  suffixIcon: Icon(Icons.supervised_user_circle),
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 50, right: 50),
                              child: TextFormField(
                                controller: password_controller,
                                validator: (pass) {
                                  if (pass!.isEmpty) {
                                    return "enter values";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: showpass,
                                obscuringCharacter: '#',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "Enter your password",
                                  labelText: "password",
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      if(showpass){
                                        showpass=false;
                                      }else{
                                        showpass=true;
                                      }
                                    });
                                  },
                                      icon: Icon(
                                          showpass==true? Icons.visibility_off : Icons.visibility)),
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 50, right: 50),
                              child: TextFormField(
                                controller: confirm_pass_controller,
                                validator: (pass) {
                                  if (pass!.isEmpty) {
                                    return "enter values";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: showpass1,
                                obscuringCharacter: '#',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "re-enter your password",
                                  labelText: "confirm password",
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      if(showpass1){
                                        showpass1=false;
                                      }else{
                                        showpass1=true;
                                      }
                                    });
                                  },
                                      icon: Icon(
                                          showpass1==true? Icons.visibility_off : Icons.visibility)),
                                ),),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final validate2 = formkey.currentState!.validate();
                                if (validate2) {
                                  String mail = email_controller.text.trim();
                                  String pwd = password_controller.text.trim();

                                  FireHelper().signUp(email: mail, password: pwd).then((result) {
                                    if (result == null) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) => login()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(result)));
                                    }
                                  });
                                } else {
                                  print("Enter valid values");
                                }
                              },
                              child: const Text("Sign up"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF11334B),
                                  minimumSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            // ElevatedButton.icon(
                            //   style: ElevatedButton.styleFrom(primary: Colors.white,
                            //       minimumSize: Size(double.infinity, 50)),
                            //   onPressed: (){
                            //     //  FireHelper().signInWithGoogle();
                            //
                            //
                            //   }, icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,), label: Text('Sign Up with Google'),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}