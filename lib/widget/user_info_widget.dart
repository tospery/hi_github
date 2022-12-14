import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import '../ex/hi_user.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildUserInfoItem(const AssetImage('res/images/job.png'),
            context.store.state.user?.realUser?.company),
        _buildUserInfoItem(const AssetImage('res/images/location.png'),
            context.store.state.user?.realUser?.location),
        _buildUserInfoItem(const AssetImage('res/images/email.png'),
            context.store.state.user?.realUser?.email),
        _buildUserInfoItem(const AssetImage('res/images/blog.png'),
            context.store.state.user?.realUser?.blog,
            isLast: true),
      ],
    );
  }

  Widget _buildUserInfoItem(AssetImage image, String? text,
      {bool isLast = false}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: hiBorder(
          bottom: !isLast,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        children: [
          Image(
            image: image,
            width: 25,
          ),
          hiSpace(width: 10),
          Text(
            text ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
