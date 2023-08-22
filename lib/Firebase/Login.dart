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

  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 12, 63, 105),
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String mail = email.text.trim();
                  String pwd = password.text.trim();

                  FireHelper().signIn(email: mail, password: pwd).then((result) {
                    if (result == null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => HomeApi()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                },
                child: Text('Login')),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegistrationFire()));
            }, child: Text('New user? SignIn'),)
          ],
        ),
      ),
    );
  }
}