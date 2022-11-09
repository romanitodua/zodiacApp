import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zodiacapp/networking/zodiacs_fetching.dart';

import 'MemeItem.dart';
import 'meme_class.dart';

class MemeMainPage extends StatefulWidget {
  const MemeMainPage({Key? key}) : super(key: key);

  @override
  State<MemeMainPage> createState() => _MemeMainPageState();
}

class _MemeMainPageState extends State<MemeMainPage> {
  bool isLoaded = false;
  Offset _tapPosition = Offset.zero;
  int number = 0;
  late List<Pages> memeItems;
  List<Widget> images = List.generate(12, (index) => Image ( image:AssetImage("assets/images/loadingjpg.jpg")));
  late List<String> pageNames;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => isLoaded?{_showContextMenu(context,number)}:{},
      onTapDown: (position) => isLoaded?{_getTapPosition(position)}:{},
      child: ListWheelScrollView(
        itemExtent: 400,
        onSelectedItemChanged: (index) => number = index,
        children: images,
      ),
    );
  }

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition
          .globalPosition); // store the tap positon in offset variable
      print(_tapPosition);
    });
  }

  void _showContextMenu(BuildContext context, int index) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 100, 100),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay!.paintBounds.size.height)),
        items: [
          PopupMenuItem(
            value: memeItems[index].pageName!,
            child: MemeItem(
              image: memeItems[index].memeLink!,
              title: memeItems[index].pageName!,
            ),
          ),
        ]);
    // perform action on selected menu item
    for(Pages e in memeItems ) {
      if (e.pageName == result) {
        redirectToPage(e.pagelink!);
      }
    }
  }

  redirectToPage(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    updateState();
    super.initState();
  }

  updateState() async {
    Memes fetched = await ZodiacFetcher.fetchMemes();
    setState(()  {
      isLoaded = true;
      memeItems = fetched.pages!;
      images = List.generate(3, (index) => Image(image: NetworkImage(
          fetched.pages![index].memeLink!
      )));
    });
  }
}
