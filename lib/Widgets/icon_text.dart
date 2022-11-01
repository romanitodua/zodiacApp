import 'package:flutter/cupertino.dart';
import 'package:zodiacapp/Widgets/smalltext.dart';

import '../Utils/dimensions.dart';

class iconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const iconTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconsize24,),
        SizedBox(width: 5,),
        SmallText(text: text,),


      ],
    );
  }
}
