import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';

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
          width: Dimensions.width100,
          height: Dimensions.height100,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        Text(title)
      ],
    );
  }

}
