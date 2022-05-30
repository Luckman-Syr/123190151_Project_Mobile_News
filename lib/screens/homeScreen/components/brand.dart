import 'package:flutter/material.dart';
import 'package:project_pakbagus/screens/profileScreen/profilePage.dart';

class BrandHome extends StatefulWidget {
  String username;
  BrandHome({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<BrandHome> createState() => _BrandHomeState();
}

class _BrandHomeState extends State<BrandHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            "https://i1.sndcdn.com/avatars-000274882735-21lyyg-t500x500.jpg",
            width: 90,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(
                    username: widget.username,
                  );
                }));
              },
              icon: Icon(Icons.people))
        ],
      ),
    );
  }
}
