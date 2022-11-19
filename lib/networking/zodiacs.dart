class ZodiacFormatter {
  List<Popularzodiacs>? popularzodiacs;
  List<OtherZodiacs>? otherZodiacs;

  ZodiacFormatter({this.popularzodiacs, this.otherZodiacs,});

  ZodiacFormatter.fromJson(Map<String, dynamic> json) {
    if (json['popularzodiacs'] != null) {
      popularzodiacs = <Popularzodiacs>[];
      json['popularzodiacs'].forEach((v) {
        popularzodiacs!.add(new Popularzodiacs.fromJson(v));
      });
    }
    if (json['other-zodiacs'] != null) {
      otherZodiacs = <OtherZodiacs>[];
      json['other-zodiacs'].forEach((v) {
        otherZodiacs!.add(new OtherZodiacs.fromJson(v));
      });
    }
  }
}

class Popularzodiacs {
  int? star_tviseba_1_number;
  int? star_tviseba_2_number;
  int? id;
  String? name;
  String? description;
  String? starTviseba1;
  String? starTviseba2;
  String? circleTviseba1;
  String? circleTviseba2;

  Popularzodiacs({
    this.star_tviseba_1_number,
    this.star_tviseba_2_number,
    this.id,
    this.name,
    this.description,
    this.starTviseba1,
    this.starTviseba2,
    this.circleTviseba1,
    this.circleTviseba2,
  });

  Popularzodiacs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    starTviseba1 = json['star-tviseba-1'];
    starTviseba2 = json['star-tviseba-2'];
    circleTviseba1 = json['circle-tviseba-1'];
    circleTviseba2 = json['circle-tviseba-2'];
    star_tviseba_1_number = json['star_tviseba_1_number'];
    star_tviseba_2_number = json['star_tviseba_2_number'];
  }
}

class OtherZodiacs {
  int? star_tviseba_1_number;
  int? star_tviseba_2_number;
  int? id;
  String? name;
  String? description;
  String? starTviseba1;
  String? starTviseba2;
  String? circleTviseba1;
  String? circleTviseba2;

  OtherZodiacs({
    this.star_tviseba_1_number,
    this.star_tviseba_2_number,
    this.id,
    this.name,
    this.description,
    this.starTviseba1,
    this.starTviseba2,
    this.circleTviseba1,
    this.circleTviseba2,
  });

  OtherZodiacs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    starTviseba1 = json['star-tviseba-1'];
    starTviseba2 = json['star-tviseba-2'];
    circleTviseba1 = json['circle-tviseba-1'];
    circleTviseba2 = json['circle-tviseba-2'];
    star_tviseba_1_number = json['star_tviseba_1_number'];
    star_tviseba_2_number = json['star_tviseba_2_number'];
  }
}
