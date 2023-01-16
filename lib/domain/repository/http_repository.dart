import 'dart:convert';
import 'dart:io';

import 'package:agendamientos/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = new HttpService._internal();
  
  HttpService._internal();



  static Future<Weather?> getWeather(String date) async {
    String url =
      "https://api.weatherapi.com/v1/future.json?key=582b30cb62db4b78a4c113847231601&q=41.40338; 2.17403&dt=$date";
    final response = await http.get(Uri.parse(url));
     final resp= weatherFromJson(response.body);
    return resp ;
  }
}
