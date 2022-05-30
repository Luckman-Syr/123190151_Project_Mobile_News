import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_pakbagus/models/account_model.dart';
import 'package:project_pakbagus/screens/loginScreen/loginPage.dart';
import 'package:project_pakbagus/screens/profileScreen/components/brand.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
    required this.username,
  }) : super(key: key);
  String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: <Widget>[
            BrandDetail(),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 211, 211, 211),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 5,
                        //       spreadRadius: 4,
                        //       color: Color.fromARGB(25, 0, 0, 0))
                        // ],
                        border: Border.all(
                            width: 0.5, color: Color.fromARGB(38, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Center(
                        child: Text(widget.username,
                            style: GoogleFonts.raleway(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                "Halo ${widget.username}, kenalin aku nathan dari team Developer aplikasi ini, mohon maaf untuk profile sedang dalam maintenance team kami.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.raleway(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(71, 33, 149, 243),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Mohon Maaf atas ketidak nyamanannya",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: _buttonLogout(context),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonLogout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      height: 80,
      child: ElevatedButton.icon(
        onPressed: () {
          bool status = false;
          _prosesLogout(status, widget.username);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LoginPage(status: status);
          }));
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 64, 64),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        label: Text(
          "LOGOUT",
          style: GoogleFonts.fredokaOne(fontSize: 15),
        ),
        icon: const Icon(Icons.logout),
      ),
    );
  }

  void _prosesLogout(bool status, String username) async {
    SharedPreferences getPref = await _myPref;
    await getPref.setBool("LoginStatus", status);
    await getPref.setString("Username", username);
  }
}
