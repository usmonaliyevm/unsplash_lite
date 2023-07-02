import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:unsplash_lite/domen/picture/picture_model.dart';
import 'package:unsplash_lite/domen/picture_exif/picture_exif_model.dart';
import '../domen/searche_picture/search_picture.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.unsplash.com/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/photos/random/")
  Future<List<PictureModel>> getRandomPictures(
    @Query("client_id") String access,
    @Query("count") int count,
  );

  @GET("/search/photos/")
  Future<SearchPicture> getSearchPictures(
    @Query("client_id") String access,
    @Query("query") String? query,
  );
  @GET("/search/photos/")
  Future<SearchPicture> getSearchPhotosCutsom(
    @Query("client_id") String access,
    @Query("query") String? query,
    @Query("orientation") String? orientation,
    @Query("color") String? color,
    @Query("sort_by") String? sortBy,
    @Query("quality") String? quality,
  );
  @GET("/photos/{id}")
  Future<PictureExifModel> getPhotoInfo(
    @Query("client_id") String access,
    @Path("id") String id,
  );
}
