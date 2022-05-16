import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sampleapp/pages/components/inputField.dart';
import 'package:sampleapp/pages/routes/routes.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'calenderPage.dart';

class AddVerlofPage extends StatefulWidget {
  static const String routeName = '/addVerlof';

  const AddVerlofPage({Key? key}) : super(key: key);

  @override
  _AddVerlofPageState createState() => _AddVerlofPageState();
}

class _AddVerlofPageState extends State<AddVerlofPage> {
  int totalDays = 15;

  DateTime? _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  int usedTotalDays() {
    int nbDays = 0;
    DateTime currentDay = _startDate!;
    while (currentDay.isBefore(_endDate!)) {
      currentDay = currentDay.add(Duration(days: 1));
      if (currentDay.weekday != DateTime.saturday &&
          currentDay.weekday != DateTime.sunday) {
        nbDays += 1;
      }
    }
    return (totalDays - nbDays);
  }

  String daysString() {
    if (usedTotalDays() >= 0) {
      return usedTotalDays().toString();
    }
    return "Insufficient Days";
  }

  Color tooManyDaysTaken() {
    if (usedTotalDays().isNegative) {
      return const Color.fromARGB(255, 245, 86, 86);
    }
    return RainbowTheme.primary_1;
  }

  Color tooManyDaysTakenStartAndFinish() {
    if (usedTotalDays().isNegative) {
      return Colors.red;
    }
    return RainbowTheme.primary_1;
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate = args.value.startDate;
      _endDate = args.value.endDate ?? args.value.startDate;
    });
  }

  Widget uiBuild(BuildContext context, String? title) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
          elevation: 0,
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
          leading: BackButton(
            color: RainbowTheme.primary_1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalenderPage()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!.absence +
                          " " +
                          AppLocalizations.of(context)!.daysLeft +
                          ": " +
                          daysString(),
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 25,
                        child: Text(
                          AppLocalizations.of(context)!.from +
                              ": " +
                              DateFormat.yMMMMEEEEd().format(_startDate!),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 25,
                        child: Text(
                            AppLocalizations.of(context)!.from +
                                ": " +
                                DateFormat.yMMMMEEEEd().format(_endDate!),
                            style: const TextStyle(
                              fontSize: 16,
                            ))),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: SfDateRangePicker(
                        selectableDayPredicate: (DateTime dateTime) {
                          if (dateTime.weekday == DateTime.saturday ||
                              dateTime.weekday == DateTime.sunday) {
                            return false;
                          }
                          return true;
                        },
                        controller: _controller,
                        onSelectionChanged: selectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                        initialSelectedRange: PickerDateRange(DateTime.now(),
                            DateTime.now().add(Duration(days: totalDays))),
                        startRangeSelectionColor:
                            tooManyDaysTakenStartAndFinish(),
                        endRangeSelectionColor:
                            tooManyDaysTakenStartAndFinish(),
                        rangeSelectionColor: tooManyDaysTaken(),
                      ),
                    ),
                    Container(
                      child: InputField(
                          title: AppLocalizations.of(context)!.reason,
                          hint: AppLocalizations.of(context)!.giveReason),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(250, 45)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size.fromWidth(320)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                RainbowTheme.primary_1),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                RainbowTheme.secondary),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                        color: RainbowTheme.primary_1))),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                          ),
                          label: Text(AppLocalizations.of(context)!.addVerlof),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    final DateTime today = DateTime.now();
    totalDays = 15;
    _startDate = today;
    _endDate = today.add(const Duration(days: 3));
    _controller.selectedRange =
        PickerDateRange(today, today.add(const Duration(days: 3)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = AppLocalizations.of(context)!.addVerlof;
    return uiBuild(context, title);
  }
}
