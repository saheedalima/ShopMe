import 'package:flutter/material.dart';
import '../View/HomePage.dart';
import 'FirebaseHelper.dart';
import 'Registration.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  bool showpass = true;
  var formkey2 = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formkey2,
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
                        "Sign In",
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
                        "Welcome back! login with your credentials",
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
                                  if (email!.isEmpty || !email.contains('@') ||
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
                                controller: pass_controller,
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
                                      showpass=!showpass;
                                    });
                                  },
                                      icon: Icon(
                                          showpass? Icons.visibility_off : Icons.visibility)),
                                ),),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final validate2 = formkey2.currentState!.validate();
                                if (validate2) {
                                  String mail = email_controller.text.trim();
                                  String pwd = pass_controller.text.trim();

                                  FireHelper().signIn(email: mail, password: pwd).then((result) {
                                    if (result == null) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) => HomeApi()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(result)));
                                    }
                                  });
                                } else {
                                  print("Enter valid values");
                                }
                              },
                              child: const Text("sign in"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF11334B),
                                  minimumSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationFire()));
                            }, child: Text('New user? SignIn'),)
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