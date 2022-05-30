import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandDetail extends StatefulWidget {
  BrandDetail({Key? key}) : super(key: key);

  @override
  State<BrandDetail> createState() => _BrandDetailState();
}

class _BrandDetailState extends State<BrandDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          Image.network(
            "https://i1.sndcdn.com/avatars-000274882735-21lyyg-t500x500.jpg",
            width: 90,
          ),
          Container(
            width: 70,
            child: Text(
              "NEWS",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
