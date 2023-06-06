import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_pokeapi/utils/constants.dart';

class ApiCall {
  Future<String?> getPokemon() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String jsonDataString = response.body;
        final res = jsonDataString;
        return res;
      }
    } catch (err) {
      log(err.toString());
    }
    return null;
  }
}
