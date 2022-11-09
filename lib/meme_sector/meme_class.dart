class Memes {
  List<Pages>? pages;

  Memes({this.pages});

  Memes.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }
}

class Pages {
  String? pageName;
  String? pagePfp;
  String? memeLink;
  String? pagelink;

  Pages({this.pageName, this.pagePfp, this.memeLink});

  Pages.fromJson(Map<String, dynamic> json) {
    pageName = json['page-name'];
    pagePfp = json['page-pfp'];
    memeLink = json['meme-link'];
    pagelink = json['page-link'];
  }
}
