import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApi {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET("/posts")
  Future<HttpResponse> getPosts();

  @POST("/posts")
  @Header('content-type: application/json')
  Future<HttpResponse> createPost(@Body() Map<String, dynamic> post);

  @PUT("/posts/{id}")
  @Header('content-type: application/json')
  Future<HttpResponse> updatePost(@Path("id") int id, @Body() Map<String, dynamic> post);

  @DELETE("/posts/{id}")
  Future<HttpResponse> deletePost(@Path("id") int id);
}
