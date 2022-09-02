import '../request.dart';
import '../response.dart';

abstract class HiBaseAdapter {
  Future<HiBaseResponse> send(HiBaseRequest request);
}
