class AppUrls{
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';
  static String getRefreshTokenPath() {
    return "$baseUrl/Administrator/RefreshToken";
  }
}