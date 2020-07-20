import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Rehberler> parseRehberler(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Rehberler>((json) => Rehberler.fromJson(json)).toList();
}

Future<List<Rehberler>> fetchRehberler(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/rehber.php');

  return compute(parseRehberler, response.body);
}

class Rehberler {
  final String name;
  final String news_image;

  Rehberler({this.name, this.news_image});

  factory Rehberler.fromJson(Map<String, dynamic> json) {
    return Rehberler(
      name: json['name'] as String,
      news_image: json['news_image'] as String,
    );
  }
}