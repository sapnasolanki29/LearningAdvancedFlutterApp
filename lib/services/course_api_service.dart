import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/catalog.dart';

class CourseApiService{
Future<List<Course>> fetchCourses() async{
  final url=Uri.parse("https://6aead2643d3dd3d37be749a0.mockapi.io/api/v1/courses");
final response=await http.get(url);
  print(response);
if(response.statusCode==200) {
  final List<dynamic>jsonData = jsonDecode(response.body);
 // final List<Course> courses = jsonData;
  print(jsonData);

  return jsonData
      .map((courseData) => Course.fromMap(courseData as Map<String, dynamic>))
      .toList();
}else{
  throw Exception("Failed to fetch courses");
}
}
}
