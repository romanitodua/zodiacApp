import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemeItem extends StatelessWidget {
  final String title;
  final String image;
  MemeItem(
      {required this.title,
        required this.image,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
        ),
        Text(title)
      ],
    );
  }
}