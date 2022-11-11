import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zodiacapp/Widgets/app_column.dart';
import 'package:zodiacapp/Widgets/bigtext.dart';
import 'package:zodiacapp/Widgets/icon_text.dart';
import 'package:zodiacapp/Widgets/smalltext.dart';
import 'package:zodiacapp/screens/popular_zodiac.dart';

import '../../Utils/dimensions.dart';
import '../../networking/zodiacs.dart';
import '../../networking/zodiacs_fetching.dart';

class BottomMainPage extends StatefulWidget {
  const BottomMainPage({Key? key}) : super(key: key);

  @override
  State<BottomMainPage> createState() => _BottomMainPageState();
}

class _BottomMainPageState extends State<BottomMainPage> {
  var array = [
    "assets/images/libra.jpg",
    "assets/images/aries.jpg",
    "assets/images/cancer.jpg",
    "assets/images/capricorn.jpg",
    "assets/images/gemini.jpg",
    "assets/images/leo.jpg",
    "assets/images/aquarius.jpg",
    "assets/images/pisces.jpg",
    "assets/images/sagittarius.jpg",
    "assets/images/scorpio.jpg",
    "assets/images/taurus.jpg",
    "assets/images/virgo.jpg"
  ];
  var currPageValue = 0.0;
  PageController controller = PageController(viewportFraction: 0.85);
  double scalefactor = 0.8;
  double height = Dimensions.pageViewContainer;
  List<Popularzodiacs> before = [
    Popularzodiacs(
        id: 1,
        name: "Waiting for network...",
        star_tviseba_1_number: 1,
        star_tviseba_2_number: 1,
        starTviseba1: "",
        starTviseba2: "",
    description: "",
    circleTviseba1: "",
    circleTviseba2: "",
    )
  ];
  late List<Popularzodiacs> after_popular;
  late List<OtherZodiacs> after_other;
  int itemCount = 1;

  Future<void> fetch() async {
    ZodiacFormatter zf = await ZodiacFetcher.fetchZodiacs();
    setState(() {
      after_popular = zf.popularzodiacs!;
      after_other = zf.otherZodiacs!;
      itemCount = 12;
    });
  }

  Widget testpopular(int position, List<Popularzodiacs> list) {
    Matrix4 matrix = new Matrix4.identity();
    if (position == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - position) * (1 - scalefactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == currPageValue.floor() + 1) {
      var currScale =
          scalefactor + (currPageValue - position + 1) * (1 - scalefactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - position) * (1 - scalefactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scalefactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ZodiacDetails(
                        i: position,
                      )));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: const Color(0xFF69c5df),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(array[position]))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer, // amoweulis height
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(-5, -5)),
                    BoxShadow(color: Color(0xFFFFFFFF), offset: Offset(-5, 0)),
                    BoxShadow(color: Color(0xFFFFFFFF), offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ZodiacDetails(
                              i: position,
                            )));
                  },
                  child: AppColumn(
                      circle_icon: LineIcons.circle,
                      icon: Icon(LineIcons.star, size: 15, color: Color(0xFF69c5df)),
                      star_tviseba_1_number: list[position].star_tviseba_1_number!,
                      star_tviseba_2_number: list[position].star_tviseba_2_number!,
                      name: list[position].name!,
                      star_tviseba_1: list[position].starTviseba1!,
                      star_tviseba_2: list[position].starTviseba2!,
                      circle_tviseba_1: list[position].circleTviseba1!,
                      circle_tviseba_2: list[position].circleTviseba2!),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget testother(int index, List<OtherZodiacs> list) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ZodiacDetails(
                      i: index,
                    )));
      },
      child: Container(
        height: Dimensions.listViewTextContSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                bottomRight: Radius.circular(Dimensions.radius20)),
            color: const Color(0xFFFFFFFF)),
        child: Padding(
          padding: EdgeInsets.only(left: Dimensions.width10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: list[index].name!),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(text: "Click to read more"),
              SizedBox(
                height: Dimensions.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconTextWidget(
                      icon: LineIcons.circle,
                      text: list[index].circleTviseba1!,
                      iconColor: const Color(0xFFFCE4EC)),
                  iconTextWidget(
                      icon: LineIcons.circle,
                      text: list[index].circleTviseba2!,
                      iconColor: const Color(0xFFFCE4EC)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      setState(() {
        currPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: controller,
              itemCount: itemCount,
              itemBuilder: (context, position) {
                return itemCount==1?CircularProgressIndicator():testpopular(position, after_popular);
              }),
        ),
        DotsIndicator(
          dotsCount: itemCount,
          position: currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Browse
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Browse"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: const Color(0x0fffffff),
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "All Zodiacs At your Disposal",
                ),
              )
            ],
          ),
        ),
        // items

        Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //image
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ZodiacDetails(
                                        i: index,
                                      )));
                        },
                        child: Container(
                            width: Dimensions.listViewImageSize,
                            height: Dimensions.listViewImageSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: const Color(0xFFFFFFFF),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(array[index])),
                            )),
                      ),
                      //textcontainer
                      Expanded(
                        child: itemCount==1?LinearProgressIndicator():testother(index, after_other),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
