import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/pages/components/button.dart';
import 'package:sampleapp/pages/components/inputField.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'calenderPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskPage extends StatefulWidget {
  static const String routeName = '/addTask';
  static const String title = 'Add Task';

  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime selectedDate = DateTime.now();
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 5)));
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 30];
  String selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    String title = AppLocalizations.of(context)!.addTask;
    return uiBuild(context, title);
  }

  Widget uiBuild(BuildContext context, String? title) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: RainbowTheme.primary_1,
        bottomOpacity: 0,
        backgroundColor: RainbowTheme.secondary,
        leading: BackButton(
          color: RainbowTheme.primary_1,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalenderPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: Text(
                title!,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              alignment: Alignment.topLeft,
            ),
            InputField(
                title: AppLocalizations.of(context)!.title,
                hint: AppLocalizations.of(context)!.enterTitle),
            InputField(
                title: AppLocalizations.of(context)!.note,
                hint: AppLocalizations.of(context)!.enterNote),
            InputField(
                title: AppLocalizations.of(context)!.date,
                hint: DateFormat.yMd().format(selectedDate),
                widget: IconButton(
                    onPressed: () {
                      _getDateFRomUser();
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ))),
            Row(children: [
              Expanded(
                  child: InputField(
                title: AppLocalizations.of(context)!.startTime,
                hint: startTime,
                widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                    icon: const Icon(
                      Icons.access_time_outlined,
                      color: Colors.grey,
                    )),
              )),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: InputField(
                title: AppLocalizations.of(context)!.endTime,
                hint: endTime,
                widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: false);
                    },
                    icon: const Icon(
                      Icons.access_time_outlined,
                      color: Colors.grey,
                    )),
              )),
            ]),
            InputField(
              title: AppLocalizations.of(context)!.remind,
              hint: "$selectedRemind " +
                  AppLocalizations.of(context)!.minutesEarly,
              widget: DropdownButton(
                icon: const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                underline: Container(width: 0),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRemind = int.parse(newValue!);
                  });
                },
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                items: remindList.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
            InputField(
              title: AppLocalizations.of(context)!.repeat,
              hint: selectedRepeat,
              widget: DropdownButton(
                icon: const Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                underline: Container(width: 0),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRepeat = newValue!;
                  });
                },
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                items:
                    repeatList.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(
                      value!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                colorPallette(),
                Button(
                    label: AppLocalizations.of(context)!.create +
                        " " +
                        AppLocalizations.of(context)!.meeting,
                    onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }

  colorPallette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.color,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Wrap(
          children: List<Widget>.generate(3, (index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? Colors.lightBlueAccent
                          : index == 1
                              ? Colors.redAccent
                              : Colors.greenAccent,
                      child: selectedColor == index
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : Container(),
                    )));
          }),
        )
      ],
    );
  }

  _getDateFRomUser() async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (pickDate != null) {
      setState(() {
        selectedDate = pickDate;
      });
    } else {
      print(AppLocalizations.of(context)!.somethingWentWrong);
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = await pickedTime.format(context);
    if (pickedTime == null) {
      print(AppLocalizations.of(context)!.timeCancelled);
    } else if (isStartTime == true) {
      setState(() {
        startTime == formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime == formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])));
  }
}
