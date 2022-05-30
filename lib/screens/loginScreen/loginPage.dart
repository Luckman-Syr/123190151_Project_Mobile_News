import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_pakbagus/models/account_model.dart';
import 'package:project_pakbagus/screens/homeScreen/homePage.dart';
import 'package:project_pakbagus/screens/loginScreen/components/brand.dart';
import 'package:project_pakbagus/screens/signScreen/signPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  bool status;
  LoginPage({Key? key, required this.status}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  late Box<UserAccountModel> localDB = Hive.box<UserAccountModel>("user");
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      String currentUsername = _usernameController.value.text;
      String currentPassword = _passwordController.value.text;

      _prosesLogin(currentUsername, currentPassword);
    }
  }

  late bool isLogin = widget.status;
  bool _isObscure = true;
  String username = "";
  String password = "";
  String name = '';
  String email = '';
  //firebase
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // decoration: BoxDecoration(
      //     image: DecorationImage(image: NetworkImage(''), fit: BoxFit.cover)),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            children: <Widget>[
              Brand(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 80),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(15, 0, 0, 0),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset.fromDirection(0, 0))
                            ]),
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Email";
                            }
                            // reg expression for email validation
                            // if (!RegExp(
                            //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            //     .hasMatch(value)) {
                            //   return ("Please Enter a valid email");
                            // }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() => username = value);
                          },
                          maxLines: 1,
                          style: GoogleFonts.raleway(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.people,
                                color: Theme.of(context).iconTheme.color),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            fillColor: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Username',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(15, 0, 0, 0),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset.fromDirection(0, 0))
                            ]),
                        child: TextFormField(
                          controller: _passwordController,
                          maxLines: 1,
                          style: GoogleFonts.raleway(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: _isObscure,
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Please Enter your password";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please Enter a valid password(Min. 6 Character)");
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.key,
                                color: Theme.of(context).iconTheme.color),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            fillColor: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: _buttonLogin(context)),
                          // Expanded(child: _buttonSign())
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Belum punya akun?,",
                              style: GoogleFonts.raleway(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignPage();
                                  }));
                                },
                                child: Text(
                                  "SIGN",
                                  style: GoogleFonts.raleway(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _prosesLogin(String username, String password) async {
    for (int index = 0; index < localDB.length; index++) {
      if (username == localDB.getAt(index)!.username &&
          password == localDB.getAt(index)!.password) {
        isLogin = true;
        SharedPreferences getPref = await _myPref;
        await getPref.setBool("LoginStatus", isLogin);
        await getPref.setString("Username", username);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return HomePage(
            username: username,
            isLogin: isLogin,
          );
        }), (_) => false);
        // SharedPreferences getPref = await _myPref;
        // await getPref.setBool("LoginStatus", true);

      }
    }
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      height: 80,
      child: ElevatedButton.icon(
        onPressed: () {
          _submit();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        label: Text(
          "LOGIN",
          style: GoogleFonts.fredokaOne(fontSize: 15),
        ),
        icon: const Icon(Icons.login),
      ),
    );
  }
}
