import 'package:flutterprojects/Models/catalog.dart';

class FavoriteState {
  final List<Course> favorites;
  FavoriteState({this.favorites=const[]});

  bool isFavorite(Course course){
    return favorites.any((item)=>item.id==course.id);
  }
}