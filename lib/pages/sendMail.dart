import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sampleapp/pages/components/mailText.dart';
import 'package:sampleapp/pages/theme/theme.dart';

import 'mailpage.dart';

class SendMailPage extends StatefulWidget {
  static const String routeName = '/sendMail';
  static const String title = 'Send';

  SendMailPage({Key? key}) : super(key: key);

  @override
  _SendMailPageState createState() => _SendMailPageState();
}

class _SendMailPageState extends State<SendMailPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return uiBuild(context);
  }

  Widget uiBuild(BuildContext context) {
    TextEditingController controller;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(SendMailPage.title),
          foregroundColor: RainbowTheme.primary_1,
          bottomOpacity: 0,
          backgroundColor: RainbowTheme.secondary,
          leading: BackButton(
            color: RainbowTheme.primary_1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MailPage()),
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result == null) return;

                  final file = result.files.first;
                  // openFile(file);

                  final newFile = await saveFilePermanently(file);
                },
                icon: const Icon(Icons.attachment_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
          ],
        ),
        backgroundColor: RainbowTheme.secondary,
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Write an email",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 21,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MailTextField(
            title: "To:",
            textType: TextInputType.emailAddress,
            widget: IconButton(
                onPressed: () {
                  setState(() {
                    if (show == false) {
                      show = true;
                    } else if (show == true) {
                      show = false;
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 23,
                )),
            icon: Icon(Icons.person_outline, color: RainbowTheme.variant),
          ),
          show == true
              ? MailTextField(
                  title: "CC:",
                  textType: TextInputType.text,
                  icon: Icon(Icons.person_outline, color: RainbowTheme.variant),
                )
              : Container(),
          show == true
              ? MailTextField(
                  title: "bCC:",
                  textType: TextInputType.text,
                  icon: Icon(Icons.person_outline, color: RainbowTheme.variant),
                )
              : Container(),
          MailTextField(
            title: "Subject:",
            textType: TextInputType.text,
            icon: Icon(Icons.subject_outlined, color: RainbowTheme.variant),
          ),
          Container(
            height: 100,
            // margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 8, // allow user to enter 5 line in textfield
                    keyboardType: TextInputType
                        .multiline, // user keyboard will have a button to move cursor to next line
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: "Write",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: RainbowTheme.primary_1.withOpacity(0.2)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: RainbowTheme.primary_1,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontStyle: FontStyle.normal),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}

Future<File> saveFilePermanently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File('${appStorage.path}/${file.name}');

  return File(file.path!).copy(newFile.path);
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}
