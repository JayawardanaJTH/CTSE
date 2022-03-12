import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

class AgifyServices {
  static String endpoint = "https://api.agify.io";
  const AgifyServices();

  Future<int?> getAgeFromName(String name) async {
    Response response = await get(Uri.parse(endpoint).replace(queryParameters: {
      "name": name,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['age'];
    }
    throw Exception("Error is happen when call api");
  }
}
