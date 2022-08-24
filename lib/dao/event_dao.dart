import 'package:hi_flutter/netx/http.dart';
import 'package:hi_github/request/githubapi/event_request.dart';

import '../model/event.dart';

class EventDao {
  static Future<List<Event>> list(String username,
      {int pageIndex = 1, int pageSize = 10}) async {
    EventRequest request = EventRequest();
    request.pathExtra = '$username/events';
    request.add('page', pageIndex).add('per_page', pageSize);
    var base = await HiHttp.shared().fire(request);
    var json = base.json as List? ?? [];
    var list = json
        .map((e) => Event.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    return list;
  }
}
