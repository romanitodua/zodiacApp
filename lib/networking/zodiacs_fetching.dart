import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zodiacapp/meme_sector/meme_class.dart';
import 'package:zodiacapp/networking/CompatibilityFormatter.dart';
import 'package:zodiacapp/networking/zodiacs.dart';

import 'BlogDetails.dart';

class ZodiacFetcher {
  static Future<ZodiacFormatter> fetchZodiacs() async {
    final response =
        await http.get(Uri.parse('http://zodiacapp.pythonanywhere.com/'));

    if (response.statusCode == 200) {
      return ZodiacFormatter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load zodiacs");
    }
  }

  static test() async {
    var headers = {
      'X-RapidAPI-Key': '0f90c84b02mshb576ff301a3b3c1p172285jsnd30edb723928',
      'X-RapidAPI-Host': 'sameer-kumar-aztro-v1.p.rapidapi.com'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://sameer-kumar-aztro-v1.p.rapidapi.com?sign=aquarius&day=tomorrow'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(response);
  }

  static fetchMemes() async {
    final response = await http
        .get(Uri.parse('https://zodiacapp.pythonanywhere.com/memes/'));

    if (response.statusCode == 200) {
      return Memes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load memes");
    }
  }
  static fetchBlogs() async {
    final response = await http
        .get(Uri.parse('https://zodiacapp.pythonanywhere.com/blogs/'));
    if (response.statusCode == 200) {
      return BlogDetailsFetcher.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load memes");
    }
  }
  static fetchCompatibility(String s) async {
    final response = await http
        .get(Uri.parse('https://zodiacapp.pythonanywhere.com/compatibility/?compatibility=$s'));
    if (response.statusCode == 200) {
      return CompatibilityFormatter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load memes");
    }
  }
}
