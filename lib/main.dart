import 'package:flutter/material.dart';
import 'package:sampleapp/pages/events.dart';
import 'package:sampleapp/pages/home_page.dart';
import 'package:sampleapp/pages/login_page.dart';
import 'package:sampleapp/pages/notes.dart';
import 'package:sampleapp/pages/profile.dart';
import 'package:sampleapp/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.blueAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.blueAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      home: const LoginPage(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/events': (context) => const EventsPage(),
        '/notes': (context) => const NotesPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
