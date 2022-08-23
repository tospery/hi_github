import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';

class PersonalHeader extends StatefulWidget {
  const PersonalHeader({Key? key}) : super(key: key);

  @override
  State<PersonalHeader> createState() => _PersonalHeaderState();
}

class _PersonalHeaderState extends State<PersonalHeader> {
  Widget get _buildUserView {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              _buildUserInfoView,
            ],
          ),
          const Icon(
            Icons.chevron_right_outlined,
            color: Colors.grey,
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget get _buildUserInfoView {
    return Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 100,
            child: _buildUserView,
          ),
          Expanded(
            flex: 55,
            child: Container(
              decoration: BoxDecoration(
                border: hiBorder(
                  top: true,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCountView(context.string.repositories,
                      context.store.state.user!.repositoryCount),
                  _buildCountView(context.string.followers,
                      context.store.state.user!.followers),
                  _buildCountView(context.string.following,
                      context.store.state.user!.following),
                ],
              ),
            ),
          ),
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

  Widget _buildCountView(String text, int count) {
    return SizedBox(
      width: (context.mediaSize.width - 20 * 2) / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
