import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Favorites/bloc/favorite_event.dart';
import 'package:flutterprojects/Favorites/bloc/favorite_state.dart';
import '../../Models/catalog.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc():super(FavoriteState()){
    on<ToggleFavorite>((event, emit) {
      final favorites = List<Course>.from(state.favorites);

      final exists = favorites.any(
            (item) => item.id == event.course.id,
      );
      if (exists) {
        favorites.removeWhere(
              (item) => item.id == event.course.id,
        );
      } else {
        favorites.add(event.course);
      }

      emit(FavoriteState(favorites: favorites));
    });
on<RemoveFavorite>((event,emit){
  final favorites=List<Course>.from(state.favorites);

  favorites.removeWhere(
      (item)=>item.id==event.course.id
  );

emit(FavoriteState(favorites: favorites));
});
    }
  }