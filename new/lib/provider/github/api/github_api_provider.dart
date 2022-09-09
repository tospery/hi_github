import 'package:hi_get/hi_get.dart';

class GithubApiProvider extends GetConnect {
  //   @override
  // void onInit() {
  //   httpClient.defaultDecoder =
  //       (val) => CasesModel.fromJson(val as Map<String, dynamic>);
  //   httpClient.baseUrl = 'https://api.covid19api.com';
  // }

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://api.github.com';
  }
}
