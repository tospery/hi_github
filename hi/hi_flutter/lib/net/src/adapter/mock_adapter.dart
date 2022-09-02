import '../response.dart';
import 'adapter.dart';
import '../request.dart';

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
