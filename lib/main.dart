import 'package:flutter/material.dart';
import 'package:sampleapp/pages/ThemeListPage.dart';
import 'package:sampleapp/pages/addMeeting.dart';
import 'package:sampleapp/pages/addReminder.dart';
import 'package:sampleapp/pages/addTask.dart';
import 'package:sampleapp/pages/addVerlof.dart';
import 'package:sampleapp/pages/events.dart';
import 'package:sampleapp/pages/calenderPage.dart';
import 'package:sampleapp/pages/list_page.dart';
import 'package:sampleapp/pages/login_page.dart';
import 'package:sampleapp/pages/mailpage.dart';
import 'package:sampleapp/pages/profile.dart';
import 'package:sampleapp/pages/readMail.dart';
import 'package:sampleapp/pages/sendMail.dart';
import 'package:sampleapp/pages/settings.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.blueAccent,
        textTheme: const TextTheme(
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
      home: SplashScreen(
        seconds: 8,
        navigateAfterSeconds: LoginPage(),
        backgroundColor: Colors.white,
        image: Image.asset('assets/images/rainbow.png'),
        photoSize: 150.0,
        title: const Text(
          "version - 1.0.1",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal),
        ),
        loaderColor: Colors.blueAccent,
        useLoader: true,
      ),
      // initialRoute: '/login',
      routes: {
        '/calender': (context) => const CalenderPage(),
        '/events': (context) => const EventsPage(),
        '/mail': (context) => const MailPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/list': (context) => const ListPage(),
        '/addVerlof': (context) => const AddVerlofPage(),
        '/addTask': (context) => const AddTaskPage(),
        '/addReminder': (context) => const AddReminderPage(),
        '/addMeeting': (context) => const AddMeetingPage(),
        '/readMail': (context) => ReadMailPage(
              io: null,
            ),
        '/chooseTheme': (context) => ThemeListPage(),
        '/sendMail': (context) => SendMailPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
