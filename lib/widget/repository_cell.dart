import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/model/repository.dart';

class RepositoryCell extends StatelessWidget {
  final Repository repository;

  const RepositoryCell({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: Column(
        children: [
          _buildTop(context),
          _buildDesc(context),
        ],
      ),
      // child: Flex(
      //   direction: Axis.vertical,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Expanded(
      //       flex: 50,
      //       child: _buildTop(context),
      //     ),
      //     Expanded(
      //       flex: 100,
      //       child: Container(
      //         color: Colors.white,
      //         child: _buildDesc(context),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'res/images/repository.png',
            height: 32,
            color: hiRandomColor,
          ),
          hiSpace(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(context),
              hiSpace(height: 2),
              _buildSubtitle(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: hiRandomColor,
            width: 10,
            height: 10,
          ),
        ),
        hiSpace(width: 4),
        Text(
          repository.language ?? '',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  _buildTitle(BuildContext context) {
    return SizedBox(
      width: context.mediaQueryData.size.width - 15 - 32 - 8 - 20,
      child: Text(
        repository.fullName ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  _buildDesc(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        repository.description ?? '',
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}
