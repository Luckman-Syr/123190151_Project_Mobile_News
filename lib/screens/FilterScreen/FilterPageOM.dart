import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/news_model.dart';
import 'package:project_pakbagus/screens/FilterScreen/filterPage.dart';
import 'package:project_pakbagus/screens/FilterScreen/filterPageCategory.dart';
import 'package:project_pakbagus/screens/detailsScreen/detilsPage.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';
import 'package:project_pakbagus/screens/homeScreen/components/country.dart';
import 'package:project_pakbagus/screens/homeScreen/components/news.dart';
import 'package:project_pakbagus/screens/homeScreen/components/popular.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FilterPageOM extends StatefulWidget {
  FilterPageOM(
      {Key? key, required this.id, required this.name, required this.index})
      : super(key: key);

  final String id;
  final String name;
  final int index;
  @override
  State<FilterPageOM> createState() => _FilterPageOMState();
}

class _FilterPageOMState extends State<FilterPageOM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: _load(),
      ),
    );
  }

  Widget _load() {
    if (widget.index == 1) {
      return FilterPage(id: widget.id, name: widget.name);
    } else {
      return FilterPageCategory(id: widget.id, name: widget.name);
    }
  }
}
