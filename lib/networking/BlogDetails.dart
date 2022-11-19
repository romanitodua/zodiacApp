class BlogDetailsFetcher {
  List<BlogDetails>? blogDetails;

  BlogDetailsFetcher({this.blogDetails});

  BlogDetailsFetcher.fromJson(Map<String, dynamic> json) {
    if (json['blog-details'] != null) {
      blogDetails = <BlogDetails>[];
      json['blog-details'].forEach((v) {
        blogDetails!.add(new BlogDetails.fromJson(v));
      });
    }
  }
}

class BlogDetails {
  String? title;
  String? img;
  String? author;
  String? date;
  String? discription;

  BlogDetails({this.title, this.img, this.author, this.date, this.discription});

  BlogDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    author = json['author'];
    date = json['date'];
    discription = json['discription'];
  }
}