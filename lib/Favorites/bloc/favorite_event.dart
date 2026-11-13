
import 'package:flutterprojects/Models/catalog.dart';

abstract class FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent{
  final Course course;
  ToggleFavorite(this.course);
}

class RemoveFavorite extends FavoriteEvent{
  final Course course;
  RemoveFavorite(this.course);
}