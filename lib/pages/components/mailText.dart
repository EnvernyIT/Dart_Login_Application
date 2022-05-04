import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sampleapp/pages/theme/theme.dart';

class MailTextField extends StatelessWidget {
  final String title;
  final String? hint;
  final double? height;
  final TextInputType textType;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? widget;
  final Icon? icon;
  const MailTextField(
      {Key? key,
      required this.title,
      this.hint,
      this.height,
      required this.textType,
      this.maxLines,
      this.minLines,
      this.textInputAction,
      this.controller,
      this.widget,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )),
          Container(
            height: height ?? 52,
            // margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                maxLines: maxLines,
                minLines: minLines,
                // textInputAction: TextInputAction.newline,
                controller: controller,
                keyboardType: textType,
                decoration: InputDecoration(
                    hintText: hint,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: RainbowTheme.primary_1.withOpacity(0.2)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: RainbowTheme.primary_1,
                      ),
                    ),
                    prefixIcon: icon),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontStyle: FontStyle.normal),
              )),
              widget ?? Container(),
            ]),
          ),
        ],
      ),
    );
  }
}
