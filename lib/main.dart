import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
import 'package:sampleapp/pages/taalListPage.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Locale? _locale;

  void setLocale(Locale value) {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _locale = value;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Rainbow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: RainbowTheme.primary_1,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: RainbowTheme.secondary,
        ),
        accentColor: RainbowTheme.primary_1,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: RainbowTheme.primary_1),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: RainbowTheme.primary_1,
          ),
          bodyText1: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: RainbowTheme.secondary,
          ),
        ),
      ),
      home: SplashScreen(
        seconds: 7,
        navigateAfterSeconds: LoginPage(),
        backgroundColor: Colors.white,
        image: Image.asset('assets/images/rainbow.png'),
        photoSize: 150.0,
        title: const Text(
          "version - 1.0.6",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
        loaderColor: RainbowTheme.primary_1,
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
        '/chooseTheme': (context) => const ThemeListPage(),
        '/chooseLanguage': (context) => const TaalListPage(),
        '/sendMail': (context) => SendMailPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
