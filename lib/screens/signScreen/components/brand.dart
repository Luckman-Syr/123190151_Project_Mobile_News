import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(
            "https://i1.sndcdn.com/avatars-000274882735-21lyyg-t500x500.jpg",
            width: 100,
          ),
          Text(
            "Sign",
            style:
                GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
