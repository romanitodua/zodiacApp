import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zodiacapp/blog_sector/blogs.dart';
import 'package:zodiacapp/compatibility/compatibility_main.dart';

import '../meme_sector/meme_main.dart';
import '../screens/main_body.dart';

class MainZodiacPage extends StatefulWidget {
  const MainZodiacPage({super.key});

  @override
  State<MainZodiacPage> createState() => _MainZodiacPageState();
}

class _MainZodiacPageState extends State<MainZodiacPage> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[MainBody(),NewsLetters(),CompatibilityMain(),MemeMainPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.newspaper,
                  text: 'NewsLetter',
                ),
                GButton(
                  icon: LineIcons.scroll,
                  text: 'Compatibility',
                ),
                GButton(
                  icon: LineIcons.laughingSquintingFace,
                  text: 'Memes',
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
