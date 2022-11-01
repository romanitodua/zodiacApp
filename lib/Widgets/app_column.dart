import 'package:flutter/cupertino.dart';
import 'package:zodiacapp/Widgets/smalltext.dart';
import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import 'bigtext.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  final String name;
  final String star_tviseba_1;
  final String star_tviseba_2;
  final String circle_tviseba_1;
  final String circle_tviseba_2;

  const AppColumn(
      {Key? key,
      required this.name,
      required this.star_tviseba_1,
      required this.star_tviseba_2,
      required this.circle_tviseba_1,
      required this.circle_tviseba_2,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(
          text: name,
          size: Dimensions.fontsize26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: [
                ...List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, size: 15, color: Color(0xFF69c5df)))
              ],
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: star_tviseba_1)
          ],
        ),
        SizedBox(
          height: Dimensions.height5,
        ),
        Row(
          children: [
            Wrap(
              children: [
                ...List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, size: 15, color: Color(0xFF69c5df)))
              ],
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: star_tviseba_2)
          ],
        ),
        SizedBox(height: Dimensions.height5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconTextWidget(
                icon: Icons.circle_sharp,
                text: circle_tviseba_1,
                iconColor: Color(0xFFFCE4EC)),
            iconTextWidget(
                icon: Icons.circle_sharp,
                text: circle_tviseba_2,
                iconColor: Color(0xFFFCE4EC)),
          ],
        )
      ],
    );
  }
}
