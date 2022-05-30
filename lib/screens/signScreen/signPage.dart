import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/account_model.dart';
import 'package:project_pakbagus/screens/loginScreen/loginPage.dart';
import 'package:project_pakbagus/screens/signScreen/components/brand.dart';
import 'package:http/http.dart' as http;

class SignPage extends StatefulWidget {
  SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  Box<UserAccountModel> localDB = Hive.box<UserAccountModel>("user");

  final _formKey = GlobalKey<FormState>();
  @override
  bool _isObscure = true, cek = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  status: false,
                )),
        (_) => false,
      );
      localDB.add(UserAccountModel(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
      _usernameController.clear();
      _passwordController.clear();
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Brand(),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 50),
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
                    controller: _nameController,
                    maxLines: 1,
                    style: GoogleFonts.raleway(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.edit,
                          color: Theme.of(context).iconTheme.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Nama',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Username',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
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
                    controller: _emailController,
                    maxLines: 1,
                    style: GoogleFonts.raleway(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.email,
                          color: Theme.of(context).iconTheme.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Email',
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
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
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key,
                          color: Theme.of(context).iconTheme.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
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
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Re-Password",
                      style: GoogleFonts.raleway(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 10),
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
                    controller: _repasswordController,
                    maxLines: 1,
                    style: GoogleFonts.raleway(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: cek,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key,
                          color: Theme.of(context).iconTheme.color),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Re-Password',
                      suffixIcon: IconButton(
                          icon: Icon(
                            cek ? Icons.visibility : Icons.visibility_off,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            setState(() {
                              cek = !cek;
                            });
                          }),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                _buttonSign(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sudah punya akun?,",
                        style: GoogleFonts.raleway(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.raleway(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSign() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      height: MediaQuery.of(context).size.width * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage(
                        status: false,
                      )),
              (_) => false,
            );
            localDB.add(UserAccountModel(
              username: _usernameController.text,
              password: _passwordController.text,
            ));
            _usernameController.clear();
            _passwordController.clear();
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
          final snackBar = SnackBar(content: Text('Data saved successfully!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        label: Text("SIGN",
            style: GoogleFonts.fredokaOne(fontSize: 15),
            textAlign: TextAlign.left),
        icon: const Icon(Icons.app_registration),
      ),
    );
  }
}
