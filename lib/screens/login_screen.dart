import 'package:flutter/material.dart';
import 'package:image_classification/screens/home_screen_widget.dart';
import 'package:image_classification/screens/reset_password.dart';
import 'package:image_classification/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final Function onLogin;

  LoginScreen({required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.lock, size: 70, color: Colors.green),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _emailController,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'ኢሜል ያስገቡ',
                      labelStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: 'የይለፍ-ቃል ያስገቡ',
                      labelStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(Size(250, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 70, 224, 23)),
                    ),
                    onPressed: () {
                       widget.onLogin();
                      // FirebaseAuth.instance
                      //     .signInWithEmailAndPassword(
                      //         email: _emailController.text,
                      //         password: _passwordController.text)
                      //     .then((value) {
                      //   widget.onLogin();
                      // }).catchError((error) {
                      //   print(error.toString());
                      // });
                    },
                    child: Text(
                      "ይግቡ",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Tosignup(),
                  Toreset(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Toreset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ResetPassword()));
      },
      child: Text(
        "የይለፍ ቃል ረስቻለሁ?",
        style: GoogleFonts.poppins(),
      ),
    );
  }
}

class Tosignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'አካውንት የለኝም።',
          style: GoogleFonts.poppins(),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: Text(
            "ልመዝግብ",
            style: GoogleFonts.poppins(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
