import 'package:cv/cv.dart';

abstract class HiDbRecord extends CvModelBase {
  static const columnId = '_id';
  
  final id = CvField<int>(columnId);
}