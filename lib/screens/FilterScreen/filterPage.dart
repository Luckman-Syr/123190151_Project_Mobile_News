import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/category_in_country.dart';
import 'package:project_pakbagus/models/category_model.dart';
import 'package:project_pakbagus/models/negara_model.dart';
import 'package:project_pakbagus/models/news_model.dart';
import 'package:project_pakbagus/screens/FilterScreen/components/brand.dart';
import 'package:project_pakbagus/screens/detailsScreen/components/brand.dart';
import 'package:project_pakbagus/screens/detailsScreen/detilsPage.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';
import 'package:project_pakbagus/screens/loginScreen/components/brand.dart';
import 'package:project_pakbagus/service/news_data_category.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key, required this.id, required this.name})
      : super(key: key);
  final String id;
  final String name;
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int index = 0;
  List dataId = [
    "all",
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology",
  ];
  List setOn = [0, 1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    print(index);
    return Column(
      children: <Widget>[
        BrandFilter(),
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
                    widget.name,
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
                    child: Icon(Icons.flag)),
              ),
            ],
          ),
        ),
        Expanded(
          child: index == 0 ? _renderContent() : _renderContent2(index),
        )
      ],
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: _createListButton()),
        ),
        Expanded(
          flex: 8,
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: _buildNewsCard(widget.id)),
        )
      ],
    );
  }

  Widget _renderContent2(int index) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: _createListButton()),
        ),
        Expanded(
            flex: 8,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: _buildNewsCard2(widget.id, dataId[index]),
            ))
      ],
    );
  }

  Widget _createListButton() {
    var dataCategory = getSpesifikCategory();

    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _createCard(dataCategory[index], context);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.amber,
          );
        },
        itemCount: dataCategory.length);
  }

  Widget _createCard(CategoryInCountry data, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(50, 203, 2, 0),
            spreadRadius: 0.5,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0))
      ], borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        onPressed: () {
          for (int i = 0; i <= 6; i++) {
            if (data.id == dataId[i]) {
              index = i;
              setState(() {
                index = index;
              });
            }
          }
          // setState(() {
          //   index = index;
          //   data.click = 1;
          // });
        },
        child: Text(
          data.name ?? "",
          style: GoogleFonts.raleway(color: _setColor(data.click)),
        ),
        style: TextButton.styleFrom(
          backgroundColor: data.click == 1
              ? Color.fromARGB(255, 203, 2, 0)
              : Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  Color _setColor(int click) {
    if (click == 1) {
      return Colors.white;
    } else {
      return Color.fromARGB(255, 0, 0, 0);
    }
  }

  Widget _buildNewsCard(String id) {
    return FutureBuilder(
        future: NewsDataCategory.instance.loadData(id),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ArticlesModel articlesModel = ArticlesModel.fromJson(snapshot.data);
            return _buildSuccessSection(articlesModel);
          }
          return _buildLoadingSection();
        });
  }

  Widget _buildNewsCard2(String id, String? id2) {
    return FutureBuilder(
        future: NewsDataCategory.instance.loadDataCategory(id, id2),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ArticlesModel articlesModel = ArticlesModel.fromJson(snapshot.data);
            return _buildSuccessSection(articlesModel);
          }
          return _buildLoadingSection();
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ArticlesModel data) {
    return ListView.builder(
        itemCount: data.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItemNews(data.articles?[index]);
        });
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildItemNews(data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsPage(
            title: data?.title ?? "",
            image: data?.urlToImage ?? "",
            author: data?.author ?? "",
            terbit: data?.publishedAt ?? "",
            content: data?.content ?? "",
            link: data?.url ?? "",
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(36, 0, 0, 0),
                spreadRadius: 0.5,
                blurRadius: 20,
                offset: Offset(0, 0), // changes position of shadow
              )
            ]),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 0, right: 10),
                  child: _buidImageItem(data.urlToImage ?? ""),
                )),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          data.title ?? "",
                          style: GoogleFonts.raleway(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        )),
                    Container(
                        child: Text(
                      data.description ?? "",
                      style: GoogleFonts.roboto(fontSize: 12),
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "${data?.author}, ${data?.publishedAt?.substring(0, 10)}",
                        style: GoogleFonts.courierPrime(fontSize: 8),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ],
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
