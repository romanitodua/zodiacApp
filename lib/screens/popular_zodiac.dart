import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:zodiacapp/Widgets/app_column.dart';
import 'package:zodiacapp/Widgets/app_icon.dart';
import 'package:zodiacapp/ad_state.dart';
import 'package:zodiacapp/home%20page/mainzodiacpage.dart';
import 'package:zodiacapp/networking/zodiacs.dart';

import '../Utils/dimensions.dart';
import '../Widgets/bigtext.dart';
import '../Widgets/expandable_text.dart';
import '../networking/zodiacs_fetching.dart';

class ZodiacDetails extends StatefulWidget {
  int i;

  ZodiacDetails({Key? key, required this.i}) : super(key: key);

  @override
  State<ZodiacDetails> createState() => _ZodiacDetailsState();
}

class _ZodiacDetailsState extends State<ZodiacDetails> {
   BannerAd? banner;

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
    "assets/images/virgo.jpg",
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

  BannerAdListener get adListener => _adListener;

  final BannerAdListener _adListener =
      BannerAdListener(onAdLoaded: (ad) => print(ad));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) => {
          setState(() {
            banner = BannerAd(
                size: AdSize.banner,
                adUnitId: AdState.bannerAdUnitID,
                listener: _adListener,
                request: AdRequest())
              ..load();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularZodiacImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(array[widget.i]))),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainZodiacPage(),
                            ));
                      },
                      behavior: HitTestBehavior.opaque,
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconcolor: Colors.red,
                      ))
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularZodiacImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Color(0xFFFFFFFF)),
                child: _identifyZodiac(widget.i),
              )),
          Positioned(
              bottom: 0, left: 0, right: 0, height: 50,
              child: banner == null?const SizedBox(height: 50,):AdWidget(ad: banner!)
          )
          // expandable widget
        ],
      ),
    );
  }

  Widget _identifyZodiac(int i) {
    return FutureBuilder<ZodiacFormatter>(
      future: ZodiacFetcher.fetchZodiacs(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("ERROR");
        } else if (snapshot.hasData) {
          {
            ZodiacFormatter zf = snapshot.data!;
            if (i > 11) {
              for (final e in zf.otherZodiacs!) {
                if (e.id == i) {
                  return Column(
                    children: [
                      AppColumn(
                        circle_icon: LineIcons.circle,
                        icon: Icon(LineIcons.star,
                            size: 15, color: Color(0xFF69c5df)),
                        star_tviseba_1_number: e.star_tviseba_1_number!,
                        star_tviseba_2_number: e.star_tviseba_2_number!,
                        name: e.name!,
                        star_tviseba_1: e.starTviseba1!,
                        star_tviseba_2: e.starTviseba2!,
                        circle_tviseba_1: e.circleTviseba1!,
                        circle_tviseba_2: e.circleTviseba2!,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Catch up"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableText(text: e.description!)))
                    ],
                  );
                }
              }
            } else {
              for (final e in zf.popularzodiacs!) {
                if (e.id == i) {
                  return Column(
                    children: [
                      AppColumn(
                        circle_icon: LineIcons.circle,
                        icon: Icon(
                          LineIcons.star,
                          size: 15,
                          color: Color(0xFF69c5df),
                        ),
                        star_tviseba_1_number: e.star_tviseba_1_number!,
                        star_tviseba_2_number: e.star_tviseba_2_number!,
                        name: e.name!,
                        star_tviseba_1: e.starTviseba1!,
                        star_tviseba_2: e.starTviseba2!,
                        circle_tviseba_1: e.circleTviseba1!,
                        circle_tviseba_2: e.circleTviseba2!,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Catch up"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableText(text: e.description!)))
                    ],
                  );
                }
              }
            }
          }
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
