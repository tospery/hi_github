import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/ex/build_context.dart';
import '../ex/hi_user.dart';

class PersonalHeader extends StatefulWidget {
  final VoidCallback? onPressed;

  const PersonalHeader({super.key, this.onPressed});

  @override
  State<PersonalHeader> createState() => _PersonalHeaderState();
}

class _PersonalHeaderState extends State<PersonalHeader> {
  Widget _buildUserView() {
    return GestureDetector(
      onTap: widget.onPressed,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FractionallySizedBox(
                    heightFactor: 0.7,
                    child: hiImage(
                      context.store.state.user?.realUser?.avatarUrl ?? '',
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
      ),
    );
  }

  Widget get _buildUserInfoView {
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
            child: _buildUserView(),
          ),
          Expanded(
            flex: 55,
            child: _buildStatView(),
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

  Widget _buildStatItem(String text, int count) {
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

  Widget _buildStatView() {
    return Container(
      decoration: BoxDecoration(
        border: hiBorder(
          top: true,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStatItem(context.string.repositories,
              context.store.state.user?.realUser?.repositoryCount ?? 0),
          _buildStatItem(context.string.followers,
              context.store.state.user?.realUser?.followers ?? 0),
          _buildStatItem(context.string.following,
              context.store.state.user?.realUser?.following ?? 0),
        ],
      ),
    );
  }
}
