import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

List<Photo> parsePhotos(String responseBody) {
  List<dynamic> list = [];
  list = json.decode(responseBody);
  List<Photo> photos = list.map((e) => Photo.fromJson(e)).toList();
  return photos;
}

Future<List<Photo>> fetchPhoto() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('no data');
  }
}
