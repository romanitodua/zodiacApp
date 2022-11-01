import 'package:flutter/cupertino.dart';

import '../Utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundoclor;
  final Color iconcolor;
  final double size;

  AppIcon(
      {Key? key, required this.icon, this.backgroundoclor =const Color(0xFFfcf4e4), this.size = 40, this.iconcolor = const Color(
          0xFFFCE4EC)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundoclor
      ),
      child: Icon(icon,color: iconcolor,size: Dimensions.iconsize16,),
    );
  }
}
