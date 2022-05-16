import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sampleapp/backend/api/ApiService.dart';
import 'package:sampleapp/backend/models/LoginModel.dart';
import 'package:sampleapp/backend/models/UserModel.dart';
import 'package:sampleapp/pages/components/progressHUD.dart';
import 'package:sampleapp/pages/calenderPage.dart';
import 'package:sampleapp/pages/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/login';

  // const ({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;

  bool? checkedValue = false;
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
    _loadUrlUsernameAndPassword();
    // setLanguage();
  }

  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  String languageValue = GetStorage("data").read("language") != null
      ? GetStorage("data").read("language").toString()
      : "English";
  var items = [
    'Nederlands',
    'English',
  ];
  late String langCode;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: uiBuild(context), inAsyncCall: isApiCallProcess, opacity: 0.5);
  }

  Widget uiBuild(BuildContext context) {
    GetStorage get = GetStorage("data");
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: RainbowTheme.primary_1,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: RainbowTheme.secondary,
                    boxShadow: [
                      BoxShadow(
                          color: RainbowTheme.hint.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Image.asset('assets/images/rainbow.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          style: TextStyle(
                              fontFamily: RainbowTheme.fontFamilyPrimary,
                              color: RainbowTheme.primary_1,
                              fontSize: 25,
                              height: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _urlController,
                          keyboardType: TextInputType.url,
                          onSaved: (input) => requestModel.url = input,
                          validator: (input) {
                            if (input == null) {
                              return AppLocalizations.of(context)!.giveLink;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.url,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1,
                              ),
                            ),
                            prefixIcon:
                                Icon(Icons.link, color: RainbowTheme.variant),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.username = input,
                          validator: (input) {
                            if (input == null) {
                              return AppLocalizations.of(context)!.giveUsername;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.username,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1,
                              ),
                            ),
                            prefixIcon:
                                Icon(Icons.person, color: RainbowTheme.variant),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          // initialValue: "W3lcome!",
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) {
                            if (input == null || input.length < 3) {
                              return AppLocalizations.of(context)!
                                  .passwordCharacters;
                            }
                            return null;
                          },
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: RainbowTheme.primary_1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: RainbowTheme.variant,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: RainbowTheme.variant.withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownButton(
                          value: languageValue,
                          icon: const Padding(
                              //Icon at tail, arrow bottom is default icon
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.arrow_circle_down_sharp)),
                          iconEnabledColor: RainbowTheme.primary_1, //Icon color
                          style: TextStyle(
                              color: RainbowTheme.primary_1, //Font color
                              fontSize: 17 //font size on dropdown button
                              ),
                          dropdownColor: RainbowTheme
                              .secondary, //dropdown background color
                          underline: Container(), //remove underline
                          isExpanded: false, //make true to make width 100%
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              languageValue = newValue!;
                              if (languageValue == "Nederlands") {
                                MyApp.of(context)?.setLocale(
                                    const Locale.fromSubtags(
                                        languageCode: 'nl'));
                              }
                              if (languageValue == "English") {
                                MyApp.of(context)?.setLocale(
                                    const Locale.fromSubtags(
                                        languageCode: 'en'));
                              }
                              langCode = newValue;
                              SharedPreferences.getInstance().then(
                                (prefs) {
                                  prefs.setString('language', newValue);
                                },
                              );
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            backgroundColor: RainbowTheme.primary_1,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: (() {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = APIService();
                              apiService.login(requestModel).then((value) {
                                if (value.valid == true) {
                                  // LoggedInUser.loggedIn = true;
                                  LoggedInUser.loggedInUser = UserModel(
                                    value.emId,
                                    value.emCode,
                                    value.username,
                                    value.firstName,
                                    value.lastName,
                                    value.roles,
                                  );
                                  LoggedInUser(
                                    true,
                                    UserModel(
                                      value.emId,
                                      value.emCode,
                                      value.username,
                                      value.firstName,
                                      value.lastName,
                                      value.roles,
                                    ),
                                    UserRoleModel(value.roles),
                                  );
                                  LoggedInUser.role =
                                      UserRoleModel(value.roles);
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  SnackBar snackBar = SnackBar(
                                    content: Text(AppLocalizations.of(context)!
                                        .loginSuccesful),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalenderPage()),
                                  );
                                } else {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  SnackBar snackBar = SnackBar(
                                    content: Text(AppLocalizations.of(context)!
                                        .loginUnSuccessful),
                                    backgroundColor: Colors.redAccent,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            }
                          }),
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.rememberMe,
                              style: TextStyle(
                                  color: RainbowTheme.primary_1, //Font color
                                  fontSize: 17 //font size on dropdown button
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                    checkColor: RainbowTheme.secondary,
                                    activeColor: RainbowTheme.primary_1,
                                    value: checkedValue,
                                    onChanged: _handleRememberme)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )));
  }

  //handle remember me function
  void _handleRememberme(bool? value) {
    checkedValue = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value!);
        prefs.setString('url', _urlController.text);
        prefs.setString('username', _usernameController.text);
        prefs.setString('password', _passwordController.text);
        prefs.setString('language', langCode);
      },
    );
    setState(() {
      checkedValue = value;
    });
  }

  //load email and password
  void _loadUrlUsernameAndPassword() async {
    int? i;
    try {
      // SharedPreferences _prefs = await SharedPreferences.getInstance();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var _url = preferences.getString("url") ?? "";
      var _username = preferences.getString("username") ?? "";
      var _password = preferences.getString("password") ?? "";
      var _rememberMe = preferences.getBool("remember_me") ?? false;
      var _langCode = preferences.getString("language") ?? "English";
      var _theme = preferences.getInt("theme");
      // print(_langCode);
      if (_rememberMe) {
        setState(() {
          checkedValue = true;
        });
        _urlController.text = _url;
        _usernameController.text = _username;
        _passwordController.text = _password;
        langCode = _langCode;
        languageValue = _langCode;
        i = _theme;
      }

      if (_langCode != null) {
        if (_langCode == "Nederlands") {
          MyApp.of(context)
              ?.setLocale(const Locale.fromSubtags(languageCode: 'nl'));
        } else if (_langCode == "English") {
          MyApp.of(context)
              ?.setLocale(const Locale.fromSubtags(languageCode: 'en'));
        }
      }

      if (i == 1) {
        setState(() {
          RainbowTheme.primary_1 = Colors.blueAccent;
          RainbowTheme.variant = Colors.blue;
          RainbowTheme.primary_2 = Colors.blueAccent;
        });
      } else if (i == 2) {
        setState(() {
          RainbowTheme.primary_1 = Colors.green;
          RainbowTheme.variant = Colors.greenAccent;
          RainbowTheme.primary_2 = Colors.lightGreen;
        });
      } else if (i == 3) {
        setState(() {
          RainbowTheme.primary_1 = Colors.black;
          RainbowTheme.variant = Colors.grey;
          RainbowTheme.primary_2 = Colors.black;
        });
      } else if (i == 4) {
        setState(() {
          RainbowTheme.primary_1 = Colors.purpleAccent;
          RainbowTheme.variant = Colors.purple;
          RainbowTheme.primary_2 = Colors.deepPurple;
        });
      } else {
        setState(() {
          RainbowTheme.primary_1 = Colors.blueAccent;
          RainbowTheme.variant = Colors.blue;
          RainbowTheme.primary_2 = Colors.blueAccent;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        return true;
      }
    }
    return false;
  }

  void colorCoding(int i) {
    if (i == 1) {
      setState(() {
        RainbowTheme.primary_1 = Colors.blueAccent;
        RainbowTheme.variant = Colors.blue;
        RainbowTheme.primary_2 = Colors.blueAccent;
      });
    } else if (i == 2) {
      setState(() {
        RainbowTheme.primary_1 = Colors.green;
        RainbowTheme.variant = Colors.greenAccent;
        RainbowTheme.primary_2 = Colors.lightGreen;
      });
    } else if (i == 3) {
      setState(() {
        RainbowTheme.primary_1 = Colors.black;
        RainbowTheme.variant = Colors.grey;
        RainbowTheme.primary_2 = Colors.black;
      });
    } else if (i == 4) {
      setState(() {
        RainbowTheme.primary_1 = Colors.purpleAccent;
        RainbowTheme.variant = Colors.purple;
        RainbowTheme.primary_2 = Colors.deepPurple;
      });
    } else {
      setState(() {
        RainbowTheme.primary_1 = Colors.blueAccent;
        RainbowTheme.variant = Colors.blue;
        RainbowTheme.primary_2 = Colors.blueAccent;
      });
    }
  }
}
