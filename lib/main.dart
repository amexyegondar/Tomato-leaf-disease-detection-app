import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification/screens/home_screen_widget.dart';
import 'dart:io';
import 'package:image_classification/screens/login_screen.dart';
import 'package:image_classification/screens/chat_screen.dart';
import 'package:image_classification/screens/predict_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_classification/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'imageMl',
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDE6RWHzJYtQ-WvNSxLZ2ot7WkjFedk7Vo',
        appId: 'image_classification',
        messagingSenderId: 'sendid',
        projectId: 'myapp',
        storageBucket: 'myapp-b9yt18.appspot.com',
      ));
  HttpOverrides.global = PostHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Recognition',
        theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.green,
          selectionHandleColor: Colors.green,
        )),
        home: Scaffold(
          bottomNavigationBar: _isLoggedIn
              ? CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor:  Colors.green,
                  color: const Color.fromARGB(255, 70, 224, 23),
                  animationDuration: const Duration(milliseconds: 300),
                  height: 55,
                  onTap: (index) {
                    setState(() {
                      _page = index;
                    });
                  },
                  items:  [
                    CurvedNavigationBarItem(
                      child: Icon(Icons.explore),
                      label: 'ያስሱ',
                      labelStyle: GoogleFonts.poppins()
                    ),
                    CurvedNavigationBarItem(
                      child: FaIcon(FontAwesomeIcons.brain),
                      label: 'መተንበያ',
                      labelStyle: GoogleFonts.poppins()
                    ),
                    CurvedNavigationBarItem(
                      child: FaIcon(FontAwesomeIcons.comment),
                      label: 'ግንኙነቶች',
                      labelStyle: GoogleFonts.poppins()
                    ),
                    CurvedNavigationBarItem(
                      child: FaIcon(FontAwesomeIcons.user),
                      label: 'ማንነት',
                      labelStyle: GoogleFonts.poppins()
                    ),
                  ],
                )
              : null,
          body: _isLoggedIn ? _getBody(_page) : LoginScreen(onLogin: onLogin),
        ));
  }

  Widget _getBody(int page) {
    switch (page) {
      case 0:
        return const HomeScreenWidget();
      case 1:
        return const PredictScreen();
      case 2:
        return const ChatScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreenWidget();
    }
  }

  void onLogin() {
    setState(() {
      _isLoggedIn = true;
      _page = 0;
      print(_isLoggedIn);
    });
  }
}

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
