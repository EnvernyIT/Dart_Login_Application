import 'package:sampleapp/pages/addMeeting.dart';
import 'package:sampleapp/pages/addReminder.dart';
import 'package:sampleapp/pages/addTask.dart';
import 'package:sampleapp/pages/addVerlof.dart';
import 'package:sampleapp/pages/profile.dart';
import 'package:sampleapp/pages/readMail.dart';
import 'package:sampleapp/pages/sendMail.dart';

import '../ThemeListPage.dart';
import '../events.dart';
import '../calenderPage.dart';
import '../list_page.dart';
import '../login_page.dart';
import '../mailpage.dart';
import '../settings.dart';

class Routes {
  static const String login = LoginPage.routeName;
  static const String calendar = CalenderPage.routeName;
  static const String events = EventsPage.routeName;
  static const String mail = MailPage.routeName;
  static const String profile = ProfilePage.routeName;
  static const String settings = SettingsPage.routeName;
  static const String list = ListPage.routeName;
  static const String addAbsence = AddVerlofPage.routeName;
  static const String addTask = AddTaskPage.routeName;
  static const String addReminder = AddReminderPage.routeName;
  static const String addMeeting = AddMeetingPage.routeName;
  static const String readMail = ReadMailPage.routeName;
  static const String sendMail = SendMailPage.routeName;
  static const String theme = ThemeListPage.routeName;
}
