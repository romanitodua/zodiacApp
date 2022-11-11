import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:zodiacapp/compatibility/compatibility_item.dart';

import '../Utils/dimensions.dart';
import '../Widgets/app_column.dart';

import '../Widgets/bigtext.dart';
import '../Widgets/expandable_text.dart';

class CompatibilityMain extends StatefulWidget {
  const CompatibilityMain({Key? key}) : super(key: key);

  @override
  State<CompatibilityMain> createState() => _CompatibilityMainState();
}

class _CompatibilityMainState extends State<CompatibilityMain> {
  bool appColumnController_1 = false;
  bool appColumnController_2 = false;
  String value_1 = "";
  String value_2 = "";
  late Widget compatibilityWidget;
  late CompatibilityItem compatibilityItem_1;
  late CompatibilityItem compatibilityItem_2;

  @override
  void initState() {
    compatibilityWidget =
        computeCompatibility(appColumnController_1, appColumnController_2);
    super.initState();
  }

  final data2 = [
    CompatibilityItem(title: "Aries", image: "assets/images/aries.jpg"),
    CompatibilityItem(title: "Libra", image: "assets/images/libra.jpg"),
    CompatibilityItem(title: "Pisces", image: "assets/images/pisces.jpg"),
    CompatibilityItem(
        title: "Sagittarius", image: "assets/images/sagittarius.jpg"),
    CompatibilityItem(title: "Scorpio", image: "assets/images/scorpio.jpg"),
    CompatibilityItem(title: "Taurus", image: "assets/images/taurus.jpg"),
    CompatibilityItem(title: "Virgo", image: "assets/images/virgo.jpg"),
    CompatibilityItem(title: "Capricorn", image: "assets/images/capricorn.jpg"),
    CompatibilityItem(title: "Aquarius", image: "assets/images/aquarius.jpg"),
    CompatibilityItem(title: "Leo", image: "assets/images/leo.jpg"),
    CompatibilityItem(title: "Gemini", image: "assets/images/gemini.jpg"),
    CompatibilityItem(title: "Cancer", image: "assets/images/cancer.jpg"),
  ];

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
                height: Dimensions.height300,
                child:
                    Padding(padding: EdgeInsets.all(20), child: inputLists()),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.height300 - Dimensions.height100,
              child: compatibilityWidget),
          // expandable widget
        ],
      ),
    );
  }

  Widget inputLists() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return DropdownButtonFormField2(
            itemPadding: const EdgeInsets.only(
              top: 5,
            ),
            decoration: InputDecoration(
              //Add isDense true and zero Padding.
              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: index == 0
                ? const Text(
                    'Select Your Zodiac Sign',
                    style: TextStyle(fontSize: 14),
                  )
                : const Text(
                    "Select Your Partner's Zodiac Sign",
                    style: TextStyle(fontSize: 14),
                  ),
            icon: const Icon(
              LineIcons.arrowDown,
              color: Colors.black45,
            ),
            iconOnClick: const Icon(LineIcons.arrowUp),
            iconSize: Dimensions.dropdownbutton / 2,
            buttonHeight: Dimensions.dropdownbutton,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: data2
                .map((item) => DropdownMenuItem<CompatibilityItem>(
                      value: item,
                      child: item,
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select Zodiac Sign.';
              }
            },
            onChanged: (value) {
              if (index == 0) {
                setState(() {
                  appColumnController_1 = true;
                  value_1 = value!.title;
                  compatibilityWidget = computeCompatibility(
                      appColumnController_1, appColumnController_2);
                });
              } else {
                setState(() {
                  appColumnController_2 = true;
                  value_2 = value!.title;
                  compatibilityWidget = computeCompatibility(
                      appColumnController_1, appColumnController_2);
                });
              }
            },
            onSaved: (value) {},
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 2);
  }

  Widget computeCompatibility(bool controller_1, bool controller_2) {
    if (value_1.isEmpty && value_2.isEmpty) {
      return Container(
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20)),
            color: const Color(0xFFFFFFFF)),
        child: Column(
          children: [
            const AppColumn(
              circle_icon: LineIcons.questionCircle,
              icon: Icon(
                LineIcons.question,
                size: 15,
                color: Color(0xFF69c5df),
              ),
              star_tviseba_1_number: 5,
              star_tviseba_2_number: 5,
              name: "Please Select Corresponding Signs",
              star_tviseba_1: "",
              star_tviseba_2: "",
              circle_tviseba_1: "",
              circle_tviseba_2: "",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Read How Compatible You Are Below",
              size: 16,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(child: SingleChildScrollView(child: Text("")))
          ],
        ),
      );
    } else if (controller_1 && !controller_2) {
      return Container(
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20)),
            color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            AppColumn(
              circle_icon: LineIcons.questionCircle,
              icon: const Icon(LineIcons.question,
                  size: 15, color: Color(0xFF69c5df)),
              star_tviseba_1_number: 5,
              star_tviseba_2_number: 5,
              name: "$value_1 &",
              star_tviseba_1: "",
              star_tviseba_2: "",
              circle_tviseba_1: "",
              circle_tviseba_2: "",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Read How Compatible You Are Below",
              size: 16,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            const Expanded(child: SingleChildScrollView(child: Text("")))
          ],
        ),
      );
    } else if (controller_2 && !controller_1) {
      return Container(
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20)),
            color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            AppColumn(
              circle_icon: LineIcons.questionCircle,
              icon: const Icon(LineIcons.question,
                  size: 15, color: Color(0xFF69c5df)),
              star_tviseba_1_number: 5,
              star_tviseba_2_number: 5,
              name: "$value_2 &",
              star_tviseba_1: "",
              star_tviseba_2: "",
              circle_tviseba_1: "",
              circle_tviseba_2: "",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Read How Compatible You Are Below",
              size: 16,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
                child: SingleChildScrollView(child: ExpandableText(text: "")))
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20),
                topLeft: Radius.circular(Dimensions.radius20)),
            color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            AppColumn(
              circle_icon: LineIcons.circle,
              icon: Icon(LineIcons.star, size: 15, color: Color(0xFF69c5df)),
              star_tviseba_1_number: 5,
              star_tviseba_2_number: 5,
              name: "$value_1 & $value_2",
              star_tviseba_1: "star-tviseba1",
              star_tviseba_2: "star-tviseba1",
              circle_tviseba_1: "circle-tviseba1",
              circle_tviseba_2: "cirlce-tviseba1",
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Read How Compatible You Are Below",
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Text(
              "The born aesthetes of the zodiac – Libra is obsessed with symmetry and strives to create equilibrium in all areas of life. Venus, the planet that governs love, beauty, and money, and also is the ruling planet of Libras who adore high art, intellectualism, and connoisseurship. They cannot stand chaos, mess, or dickery. They are idealistic perfectionists, and they invest most of their energy in keeping their environment and lives lovely, tidy, and orderly. However, Venus also makes them wonderful lovers! They’re into beautiful things and certainly born with a taste for ALL of the finer things in life. Pairing two Libras at best is pleasing and harmonious. They truly understand each other and have very similar partnership needs and expectations. Togetherness is of utmost value to both, and their similarities can be the foundation for a powerful bond.",
            )))
          ],
        ),
      );
    }
  }
}
