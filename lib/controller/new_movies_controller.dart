import 'package:movie_app/model/new_movies_model.dart';

class NewMoviesController {
  List<NewMoviesModel> imagePath = [];
  getPath() {
    for (var i = 1; i <= 3; i++) {
      NewMoviesModel newMoviesModel =
          NewMoviesModel(newMovie: 'assets/images/first_list_image$i.png');
      imagePath.add(newMoviesModel);
    }
    return imagePath;
  }
}
