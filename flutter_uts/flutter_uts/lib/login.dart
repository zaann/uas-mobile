import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uts/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(60, 102, 103, 103),
                    width: 2.0,
                  ),
                ),
              ),
              child: Image.asset(
                'lib/images/ucing.png',
                width: 500,
                height: 200,
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            Text(
              "Email*",
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: emailController,
              obscureText: false,
              style: TextStyle(fontFamily: 'Be Vietnam Pro'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan Email",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Password*",
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                  height: 2),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(fontFamily: 'Be Vietnam Pro'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan Password",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: signIn,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5C5A7F),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   'Remember Me',
                  // ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(73, 12, 10, 17)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
