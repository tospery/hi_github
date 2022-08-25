import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:hi_github/model/repository.dart';

class RepositoryCell extends StatelessWidget {
  final Repository repository;

  const RepositoryCell({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    // Container(
    //     margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
    //     padding: const EdgeInsets.only(bottom: 6),
    //     height: 106,
    //     decoration: BoxDecoration(border: borderLine(context)),
    //     child: Row(
    //       children: [
    //         _itemImage(context),
    //         _buildContent(),
    //       ],
    //     ),
    //   )
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 5,
      ),
      padding: const EdgeInsets.only(left: 0),
      height: 150,
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 50,
            child: _buildTop(),
          ),
          Expanded(
            flex: 80,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  // ClipRRect(
  //   borderRadius: BorderRadius.circular(15),
  //   child: Image.network(
  //     owner.face,
  //     width: 30,
  //     height: 30,
  //   ),
  // ),

  Widget _buildTop() {
    return Container(
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'res/images/repository.png',
            height: 24,
          ),
          hiSpace(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repository.fullName ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hiSpace(height: 2),
              Row(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
