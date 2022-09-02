import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/extension/build_context.dart';
import '../extension/hi_user.dart';

enum UserinfoClick { user, repositories, followers, following }

class UserinfoCell extends StatefulWidget {
  final ValueChanged<UserinfoClick>? onPressed;

  const UserinfoCell({super.key, this.onPressed});

  @override
  State<UserinfoCell> createState() => _UserinfoCellState();
}

class _UserinfoCellState extends State<UserinfoCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 155,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 100,
            child: _buildUserView(),
          ),
          Expanded(
            flex: 55,
            child: _buildInfoView(),
          ),
        ],
      ),
    );
  }

  _buildUserView() {
    return GestureDetector(
      onTap: () => widget.onPressed != null
          ? widget.onPressed!(UserinfoClick.user)
          : null,
      child: Container(
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
                _buildUserAvatar(),
                hiSpace(width: 12),
                _buildUserName(),
              ],
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  _buildUserAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FractionallySizedBox(
        heightFactor: 0.7,
        child: hiImage(
          context.store.state.user?.realUser?.avatarUrl ?? '',
        ),
      ),
    );
  }

  _buildUserName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.store.state.user?.username ?? '',
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        hiSpace(height: 3),
        Text(
          context.store.state.user?.realUser?.bio ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        hiSpace(height: 3),
        Text(
          getJoinedString(context.store.state.user?.realUser?.createdAt ?? ''),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  _buildInfoView() {
    return Container(
      decoration: BoxDecoration(
        border: hiBorder(
          color: Colors.grey[100],
          top: true,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => widget.onPressed != null
                ? widget.onPressed!(UserinfoClick.repositories)
                : null,
            child: _buildInfoItem(context.string.repositories,
                context.store.state.user?.realUser?.repositoryCount ?? 0),
          ),
          GestureDetector(
            onTap: () => widget.onPressed != null
                ? widget.onPressed!(UserinfoClick.followers)
                : null,
            child: _buildInfoItem(context.string.followers,
                context.store.state.user?.realUser?.followers ?? 0),
          ),
          GestureDetector(
            onTap: () => widget.onPressed != null
                ? widget.onPressed!(UserinfoClick.following)
                : null,
            child: _buildInfoItem(context.string.following,
                context.store.state.user?.realUser?.following ?? 0),
          ),
        ],
      ),
    );
  }

  _buildInfoItem(String text, int count) {
    return SizedBox(
      width: (context.mediaQueryData.size.width - 20 * 2) / 3,
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

  String getJoinedString(String str) {
    if (str.length < 10) {
      return context.string.joinedOn(str);
    }
    return context.string.joinedOn(str.substring(0, 10));
  }
}
