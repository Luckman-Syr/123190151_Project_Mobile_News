import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/news_model.dart';
import 'package:project_pakbagus/screens/detailsScreen/detilsPage.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';
import 'package:project_pakbagus/service/news_data_popular.dart';

import '../../../service/news_data_source.dart';

class Popular extends StatefulWidget {
  String username;
  Popular({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
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
                    "Popular",
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
                    child: Icon(Icons.grade)),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: _buildNewsCard(),
          ),
        )
      ],
    );
  }

  Widget _buildNewsCard() {
    return FutureBuilder(
        future: NewsDataPopular.instance.loadData(),
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

  Widget _buildItemNews(Articles? data) {
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
                  child: _buidImageItem(data?.urlToImage),
                )),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          data?.title ?? "",
                          style: GoogleFonts.raleway(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        )),
                    Container(
                        child: Text(
                      data?.description ?? "",
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
