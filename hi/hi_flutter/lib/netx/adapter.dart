import 'package:dio/dio.dart';
import '../core/logger.dart';
import 'error.dart';
import 'request.dart';
import 'response.dart';

abstract class HiBaseAdapter {
  Future<HiBaseResponse> send(HiBaseRequest request);
}

class HiMockAdapter extends HiBaseAdapter {
  @override
  Future<HiBaseResponse> send(HiBaseRequest request) {
    return Future.delayed(const Duration(milliseconds: 1000), () {
      // return HiHttpResponse(
      //   request,
      //   data: HiBaseResponse(),
      // );
      return HiBaseResponse();
    });
  }
}

class HiDioAdapter extends HiBaseAdapter {
  @override
  Future<HiBaseResponse> send(HiBaseRequest request) async {
    Response? response;
    DioError? error;
    var options = Options(headers: request.headers);
    try {
      var method = request.method();
      switch (method) {
        case HiHttpMethod.get:
          response = await Dio().get(request.urlString(), options: options);
          break;
        case HiHttpMethod.post:
          response = await Dio().post(request.urlString(),
              data: request.parameters, options: options);
          break;
        case HiHttpMethod.delete:
          response = await Dio().delete(request.urlString(), options: options);
          break;
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }

    // log('statusCode: ${response?.statusCode}');
    // log('statusMessage: ${response?.statusMessage}');
    // log('data: ${response?.data}');

    if (error != null) {
      log('发生错误了');
      throw HiHttpError(response?.statusCode ?? -1, error.toString(),
          data: await buildResponse(request, response));
    }
    // log(message, tag: 'HiHttp');

    return buildResponse(request, response);
  }

  Future<HiBaseResponse> buildResponse(
      HiBaseRequest request, Response? response) {
    var base = HiBaseResponse(json: response?.data);
    if (response?.data is Map<String, dynamic>) {
      var json = response?.data as Map<String, dynamic>;
      base = HiBaseResponse.fromJson(json);
    }
    if (response?.statusCode != 200) {
      base = HiBaseResponse(
          code: response?.statusCode ?? -1,
          message: response?.statusMessage ?? '');
    }
    return Future.value(base);
  }
}
