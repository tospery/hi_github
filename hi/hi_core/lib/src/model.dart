mixin HiModel {
  final String id = '';

  bool get isValid => id.isNotEmpty;
}

// abstract class ModelType {
//   final String id;

//   ModelType({required this.id});

//   bool get isValid => true;

//   factory ModelType.fromJson(Map<String, dynamic> json) {
//     throw UnimplementedError();
//   }

//   Map<String, dynamic> toJson();
// }

// class HiModel {

//   HiModel();

//   factory HiModel.fromJson(Map<String, dynamic> json) {
//     throw UnimplementedError();
//   }

//   Map<String, dynamic> toJson() {
//     throw UnimplementedError();
//   }

//   String get className => runtimeType.toString();
// }
