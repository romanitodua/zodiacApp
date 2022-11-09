import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../Utils/dimensions.dart';
import '../Widgets/bigtext.dart';
import '../Widgets/smalltext.dart';
import '../home page/zodiacPageBody.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            margin:  EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
            padding:  EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [BigText(text: "App Name"), Row(children: [SmallText(text: "Language"),const Icon(Icons.arrow_drop_down)],)],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: Colors.cyan[700]),
                    child:  Icon(LineIcons.search,color: Colors.white,size: Dimensions.iconsize24,),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: ZodiacPageBody(),))
      ],
    );
  }
}
