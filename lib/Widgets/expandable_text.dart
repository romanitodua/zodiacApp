import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiacapp/Widgets/smalltext.dart';

import '../Utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(height:1.8,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf),size: Dimensions.fontsize16,),
          InkWell(onTap: (){
            setState(() {
              hiddenText=!hiddenText;
            });
          },
          child: Row(
            children: [hiddenText?SmallText(text: "Show more"):SmallText(text: "Show less"),Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_upward,color: Color(0xFFFFFFF),)],
          ),)
        ],
      ),
    );
  }
}
