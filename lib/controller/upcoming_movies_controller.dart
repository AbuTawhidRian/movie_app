import 'package:movie_app/model/upcoming_movies_model.dart';

class UpComingMoviesController {
  List<UpComingMoviesModel> imagePath = [];
  getPath() {
    for (var i = 1; i <= 3; i++) {
      UpComingMoviesModel upComingMoviesModel = UpComingMoviesModel(
          upComingMovie: 'assets/images/upcoming_movie$i.png');
      imagePath.add(upComingMoviesModel);
    }
    return imagePath;
  }
}
