import 'package:flutter/material.dart';
import 'package:zodiacapp/blog_sector/blog_details.dart';
import 'package:zodiacapp/blog_sector/post_cell.dart';
import 'package:zodiacapp/networking/zodiacs.dart';
import 'package:zodiacapp/networking/zodiacs_fetching.dart';

import '../Utils/dimensions.dart';
import '../networking/BlogDetails.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;
  final String discription;

  Post(
      {required this.discription,
      required this.title,
      required this.image,
      required this.author,
      required this.date});
}

class NewsLetters extends StatefulWidget {
  @override
  State<NewsLetters> createState() => _NewsLettersState();
}

class _NewsLettersState extends State<NewsLetters> {
  final data = [
    BlogDetails(
        title: "",
        img: "assets/images/loadingjpg.jpg",
        author: "",
        date: "",
        discription: ""),
    ];
  late List<BlogDetails> blogDetails;
  late List<BlogDetails> originalNetworkList;
  late List<BlogDetails> filteredList;
  bool isLoaded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Daily Newsletter',
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/aquarius.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (value) => filterList(value),
                decoration: InputDecoration(
                  hintText: 'Search for articles',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Continue reading',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: blogDetails.length,
                    itemBuilder: (context, index) {

                      if (isLoaded == false) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetailsPage(
                                        discription:
                                        blogDetails[index].discription!,
                                        title: blogDetails[index].title!,
                                        image: blogDetails[index].img!,
                                        author: blogDetails[index].author!,
                                        date: blogDetails[index].date!, status: isLoaded,)));
                          },
                          child: PostCellWidget(
                            title: blogDetails[index].title!,
                            image: blogDetails[index].img!,
                            author: blogDetails[index].author!,
                            date: blogDetails[index].date!, status: isLoaded,
                          ),
                        );
                      }
                      else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetailsPage(
                                        discription:
                                        blogDetails[index].discription!,
                                        title: blogDetails[index].title!,
                                        image: blogDetails[index].img!,
                                        author: blogDetails[index].author!,
                                        date: blogDetails[index].date!, status: isLoaded,)));
                          },
                          child: PostCellWidget(
                            title: blogDetails[index].title!,
                            image: blogDetails[index].img!,
                            author: blogDetails[index].author!,
                            date: blogDetails[index].date!, status: isLoaded,
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) => Divider(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    blogDetails = data;
    update();
  }

  Future<void> update() async {
    BlogDetailsFetcher blogs = await ZodiacFetcher.fetchBlogs();
    List<BlogDetails> bd = blogs.blogDetails!;
    originalNetworkList = bd;
    setState(() {
      blogDetails = bd;
    });
  }

  void filterList(String value) {
    if (value.isEmpty) {
      filteredList = blogDetails;
    } else {
      filteredList = originalNetworkList
          .where((element) => element.title!.contains(value))
          .toList();
    }
    setState(() {
      blogDetails = filteredList;
    });
  }
}
