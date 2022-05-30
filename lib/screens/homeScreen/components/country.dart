import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/category_model.dart';
import 'package:project_pakbagus/models/negara_model.dart';
import 'package:project_pakbagus/models/news_model.dart';
import 'package:project_pakbagus/screens/FilterScreen/FilterPageOM.dart';
import 'package:project_pakbagus/screens/FilterScreen/filterPage.dart';
import 'package:project_pakbagus/screens/detailsScreen/detilsPage.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';

import '../../../service/news_data_source.dart';

class Country extends StatefulWidget {
  // final String id;
  String username;

  // final String singkatan;
  // final String image;

  Country({
    Key? key,
    required this.username,
    // ,
    // required this.id,
    // required this.name,
    // required this.singkatan,
    // required this.image
  }) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BrandHome(
          username: widget.username,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 203, 2, 0),
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Filter",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Icon(Icons.analytics)),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Country",
                            style: GoogleFonts.raleway(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: _createListButton(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Category",
                            style: GoogleFonts.raleway(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: _createListCategory(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 203, 2, 0),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "NOTE",
                            style: GoogleFonts.raleway(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Pilih salah satu opsi dari data di atas.",
                            style: GoogleFonts.raleway(
                                fontSize: 15, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _createListButton() {
    var dataCountry = getAllCountry();

    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _createCard(dataCountry[index], context);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.amber,
          );
        },
        itemCount: dataCountry.length);
  }

  Widget _createCard(NegaraModel data, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(50, 203, 2, 0),
            spreadRadius: 0.5,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0))
      ], borderRadius: BorderRadius.circular(5)),
      child: TextButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FilterPageOM(
                id: data.id ?? "", name: data.name ?? "", index: 1);
          }));
        },
        label: Text(
          data.name ?? "",
          style: GoogleFonts.raleway(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5)),
          child: _buidImageItem(data.image),
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.white),
      ),
    );
  }

  Widget _createListCategory() {
    var dataCategory = getAllCategory();
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _createList(dataCategory[index], context);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.amber,
          );
        },
        itemCount: dataCategory.length);
  }

  Widget _createList(CategoryModel data, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FilterPageOM(
              id: data.id ?? "", name: data.name ?? "", index: 2);
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(35, 156, 156, 156),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(bottom: 10, left: 15),
        child: Text(
          data.name ?? "",
          style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buidImageItem(String? imageUrl) {
    if (imageUrl?.isEmpty ?? true || imageUrl == null) {
      return ClipRRect(
        child: Image.asset(
          "assets/notfound.png",
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    }
    return ClipRRect(
      child: Image.network(
        imageUrl ?? "",
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
