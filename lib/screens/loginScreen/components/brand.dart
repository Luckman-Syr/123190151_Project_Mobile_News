import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/CNN.svg/640px-CNN.svg.png"));
  }
}
