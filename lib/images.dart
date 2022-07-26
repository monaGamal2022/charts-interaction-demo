import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg"),
    );
  }
}
