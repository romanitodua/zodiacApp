import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zodiacapp/networking/zodiacs.dart';

class ZodiacFetcher {
  static Future<ZodiacFormatter> fetchZodiacs() async {
    final response = await http.get(Uri.parse('http://zodiacapp.pythonanywhere.com/'));

    if (response.statusCode == 200) {
      return ZodiacFormatter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load zodiacs");
    }
  }
}
