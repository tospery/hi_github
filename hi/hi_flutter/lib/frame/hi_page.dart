import 'package:flutter/material.dart';

abstract class HiPage extends StatefulWidget {
  final Map<String, dynamic> parameters;

  const HiPage({super.key, required this.parameters});
}
