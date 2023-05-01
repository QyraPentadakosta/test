abstract class BaseApi {
  Future get(String url);
  Future post(String url, Map<String, dynamic> data);
  Future put(String url, Map<String, dynamic> data);
  Future patch(String url, Map<String, dynamic> data);
  Future delete(String url, Map<String, dynamic> data);
}
