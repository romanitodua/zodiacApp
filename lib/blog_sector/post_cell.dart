import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';

class PostCellWidget extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  final bool status;

  PostCellWidget(
      {required this.title,
      required this.image,
      required this.author,
      required this.date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            Container(
              width: Dimensions.widthforBlogPic,
              height: Dimensions.height75,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: status
                      ? Image(
                          image: NetworkImage("sds"),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: Dimensions.fontsize16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$author, $date',
                    style: TextStyle(
                      fontSize: Dimensions.font10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
