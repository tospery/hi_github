// import 'package:flutter/material.dart';
// import 'package:hi_flutter/core/logger.dart';
// import 'package:hi_flutter/frame/hi_scroll_state.dart';
// import 'package:hi_github/dao/event_dao.dart';
// import 'package:hi_flutter/hi_flutter.dart';

// class EventPage extends StatefulWidget {
//   const EventPage({Key? key}) : super(key: key);

//   @override
//   State<EventPage> createState() => EventPageState();
// }

// class EventPageState extends HiScrollState<Event, EventPage> {
//   @override
// Widget get contentChild => ListView.builder(
//       physics: const AlwaysScrollableScrollPhysics(),
//       padding: const EdgeInsets.only(top: 10),
//       itemCount: list.length,
//       controller: scrollController,
//       itemBuilder: (context, index) {
//         return Container(
//           height: 50,
//           color: HiCoreColorEx.random,
//         );
//       },
//     );

//   @override
//   Future<List<Event>> getData(int pageIndex) async {
// var list = await EventDao.list('tospery', pageIndex: pageIndex);
// return list;
//   }
// }

// class EventPageState extends State<EventPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.red,
//         width: 100,
//         height: 100,
//         child: InkWell(
//           onTap: test,
//         ),
//       ),
//     );
//   }

//   void test() async {
//     var user = await EventDao.list('tospery');
//     log('aabbcc');
//   }
// }
