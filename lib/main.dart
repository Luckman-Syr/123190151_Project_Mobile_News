import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_pakbagus/models/account_model.dart';
import 'package:project_pakbagus/screens/homeScreen/homePage.dart';
import 'package:project_pakbagus/screens/loginScreen/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  initiateLocalDB();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool status = pref.getBool("LoginStatus") ?? false;
  String username = pref.getString("Username") ?? "";
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: status == true
        ? HomePage(
            username: username,
            isLogin: status,
          )
        : LoginPage(status: false),
  ));
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAccountModelAdapter());
  await Hive.openBox<UserAccountModel>("user");
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Mantage',
      
//       home: LoginPage(),
//     );
//   }
// }
