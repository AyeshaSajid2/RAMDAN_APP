 // api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nic_project/Api_data/models/quran_api_model.dart';


class QuranServices {
  final String urlApi =
     'http://api.alquran.cloud/v1/quran/quran-uthmani';

   Future<Quran> fetchQuranData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        return Quran.fromMap(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}