
abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String Url);
  Future<dynamic> postApiResponse(String Url, String email, String password);
}