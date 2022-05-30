import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/screens/detailsScreen/components/brand.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/news_model.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String terbit;
  final String author;
  final String content;
  final String link;

  const DetailsPage(
      {Key? key,
      required this.title,
      required this.image,
      required this.terbit,
      required this.author,
      required this.content,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            BrandDetail(),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: _buidImageItem(image),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  title,
                                  style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 203, 2, 0),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      width: 45,
                                      margin: EdgeInsets.only(right: 15),
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          "Description",
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          content,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Data Berita",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(36, 0, 0, 0),
                                          spreadRadius: 0.5,
                                          blurRadius: 20,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        )
                                      ]),
                                  margin: EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  "Author / penulis",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  "Publised At",
                                                  textAlign: TextAlign.right,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Icon(Icons.arrow_forward)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  author,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  "${terbit.substring(0, 10)}",
                                                  textAlign: TextAlign.left,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(28, 240, 0, 0),
                                        spreadRadius: 2,
                                        blurRadius: 30,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      )
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                margin: EdgeInsets.only(top: 40),
                                child: TextButton(
                                  onPressed: () {
                                    _launchURL(link);
                                  },
                                  child: Text(
                                    "More Information",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }

  Widget _buidImageItem(String? imageUrl) {
    if (imageUrl?.isEmpty ?? true || imageUrl == null) {
      return ClipRRect(
        child: Image.asset(
          "assets/notfound.png",
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }
    return ClipRRect(
      child: Image.network(
        imageUrl ?? "",
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
