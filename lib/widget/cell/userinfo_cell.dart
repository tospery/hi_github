import 'package:flutter/material.dart';
import '../../model/user.dart';

enum UserinfoClick { user, repositories, followers, following }

class UserinfoCell extends StatefulWidget {
  final User? user;
  final ValueChanged<UserinfoClick>? onPressed;

  const UserinfoCell({super.key, this.user, this.onPressed});

  @override
  State<UserinfoCell> createState() => _UserinfoCellState();
}

class _UserinfoCellState extends State<UserinfoCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 120,
    );
  }
}
