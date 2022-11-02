import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompatibilityItem extends StatelessWidget {
  final String title;
  final String image;
  CompatibilityItem(
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
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        Text(title)
      ],
    );
  }
}
