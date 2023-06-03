
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:unsplash_lite/domen/picture/picture_model.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: "https://api.unsplash.com/")
abstract class ApiService{
  
 factory  ApiService(Dio dio) = _ApiService;
 
 
 @GET("/photos/random/")
 Future<List<PictureModel>> getRandomPictures(@Query("client_id") String access, @Query("count") int count);


  
}