import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sampleapp/pages/components/button.dart';
import 'package:sampleapp/pages/components/inputField.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'calenderPage.dart';

class AddMeetingPage extends StatefulWidget {
  static const String routeName = '/addMeeting';
  static const String title = 'Add Meeting';

  const AddMeetingPage({Key? key}) : super(key: key);

  @override
  _AddMeetingPageState createState() => _AddMeetingPageState();
}

class _AddMeetingPageState extends State<AddMeetingPage> {
  DateTime selectedDate = DateTime.now();
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 5)));
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 30];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
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
              child: const Text(
                "Add Meeting",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              alignment: Alignment.topLeft,
            ),
            const InputField(title: "Title", hint: "Enter title here!"),
            const InputField(title: "Note", hint: "Enter your note!"),
            InputField(
                title: "Date",
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
                title: "Start Time",
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
                title: "End Time",
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
              title: "Remind",
              hint: "$selectedRemind minutes early",
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
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                colorPallette(),
                Button(label: "Create Reminder", onTap: () {})
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
        const Text(
          "Color",
          style: TextStyle(
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
      print("Something went wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = await pickedTime.format(context);
    if (pickedTime == null) {
      print("Time Cancelled");
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
