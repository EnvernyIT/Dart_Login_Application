import 'package:flutter/material.dart';
import 'package:sampleapp/backend/api/api_service.dart';
import 'package:sampleapp/backend/model/login_model.dart';
import 'package:sampleapp/backend/model/user_model.dart';
import 'package:sampleapp/backend/services/storage.dart';
import 'package:sampleapp/pages/components/progressHUD.dart';
import 'package:sampleapp/pages/home_page.dart';

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
  final SecureStorage secureStorage = SecureStorage();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool? checkedValue = false;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  String value = "Nederlands";
  var items = [
    'Nederlands',
    'English',
  ];

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: uiBuild(context), inAsyncCall: isApiCallProcess, opacity: 0.3);
  }

  Widget uiBuild(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
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
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
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
                          "Welcome",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue:
                              "http://10.0.2.2:8080/module.web/rest/api/v1/authenticate/authenticate-user",
                          keyboardType: TextInputType.url,
                          onSaved: (input) => requestModel.url = input,
                          validator: (input) {
                            if (input == null) {
                              return "Please give url-link";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "URL",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.link,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: "Administrator",
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.username = input,
                          validator: (input) {
                            if (input == null) {
                              return "This username should exist";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Username",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(Icons.person,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          initialValue: "W3lcome!",
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) {
                            if (input == null || input.length < 3) {
                              return "This password should be more than 3 characters";
                            }
                            return null;
                          },
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
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
                            value: value,
                            // icon: const Icon(Icons.keyboard_arrow_down),
                            icon: const Padding(
                                //Icon at tail, arrow bottom is default icon
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(Icons.arrow_circle_down_sharp)),
                            iconEnabledColor:
                                Theme.of(context).accentColor, //Icon color
                            style: const TextStyle(
                                color: Colors.blueAccent, //Font color
                                fontSize: 17 //font size on dropdown button
                                ),
                            dropdownColor:
                                Colors.white, //dropdown background color
                            underline: Container(), //remove underline
                            isExpanded: false, //make true to make width 100%

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                value = newValue!;
                              });
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            backgroundColor: Theme.of(context).accentColor,
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
                                  const snackBar = SnackBar(
                                    content: Text("Login Successfull!"),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                  );
                                  if (checkedValue == true) {
                                    secureStorage.writeSecureData(
                                        "url", requestModel.url);
                                    secureStorage.writeSecureData(
                                        "username", requestModel.username);
                                    secureStorage.writeSecureData(
                                        "password", requestModel.password);
                                  }
                                } else {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  const snackBar = SnackBar(
                                    content: Text("Login Unsucessfull!"),
                                    backgroundColor: Colors.redAccent,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                              // print(requestModel.toJson());
                              // UserModel? user = LoggedInUser.loggedInUser;
                              // print(LoggedInUser.loggedInUser);
                              // print(LoggedInUser.loggedIn);
                            }
                          }),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Remember Me",
                              style: TextStyle(
                                  color: Colors.blueAccent, //Font color
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
                                    value: checkedValue,
                                    onChanged: (value) {
                                      setState(() => checkedValue = value);
                                    })),
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

  Future init() async {
    final url = await SecureStorage.readSecureURLData() ?? '';
    final username = await SecureStorage.readSecureUsernameData() ?? '';
    final password = await SecureStorage.readSecurePasswordData() ?? '';

    print(url);
    print(username);
    print(password);
  }
}
