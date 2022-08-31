import 'package:hi_flutter/hi_flutter.dart';

class RootPage extends HiRootPage {
  const RootPage({super.key, required super.parameters});

  @override
  // ignore: library_private_types_in_public_api
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends HiRootPageState {
  @override
  void initState() {
    super.initState();
    // var string = 'abc123';
    // var value = string.toLowerCase();
    // log('测试value1 = ${12.0.toInt()}');
    // log('测试value2 = ${false.toString()}');
    // try {
    //   var value = int.parse(string);
    //   log('测试value = $value');
    // } catch (e) {
    //   log('测试value = $e, 详情: ${e.toString()}');
    // }
  }
}
