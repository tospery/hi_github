import 'package:flutter/material.dart';
import 'package:hi_flutter/core/logger.dart';
import 'package:hi_flutter/core/widget.dart';
import 'package:hi_flutter/frame/function.dart';
import 'package:hi_github/extension/build_context.dart';

class PersonalHeader extends StatefulWidget {
  const PersonalHeader({Key? key}) : super(key: key);

  @override
  State<PersonalHeader> createState() => _PersonalHeaderState();
}

// return Container(
//   alignment: Alignment.bottomLeft,
//   padding: EdgeInsets.only(bottom: _dyBottom, left: 10),
//   child: Row(
//     children: [
//       ClipRRect(
//         borderRadius: BorderRadius.circular(23),
//         child: cachedImage(widget.face, width: 46, height: 46),
//       ),
//       hiSpace(width: 8),
//       Text(
//         widget.name,
//         style: const TextStyle(fontSize: 11),

class _PersonalHeaderState extends State<PersonalHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 110,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FractionallySizedBox(
              heightFactor: 0.7,
              child: hiImage(
                context.store.state.user!.avatarUrl,
              ),
            ),
          ),
          hiSpace(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.store.state.user!.login,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hiSpace(height: 3),
              Text(
                context.store.state.user?.bio ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              hiSpace(height: 3),
              Text(
                getJoinedString(context.store.state.user?.createdAt ?? ''),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          // Container(
          //   alignment: Alignment.centerRight,
          //   margin: EdgeInsets.only(right: 10),
          //   color: Colors.red,
          //   width: 50,
          //   height: 50,
          // ),
        ],
      ),
    );
  }

  String getJoinedString(String str) {
    if (str.length < 10) {
      return context.string.joinedOn(str);
    }
    return context.string.joinedOn(str.substring(0, 10));
  }
}
