// import 'package:hi_core/hi_core.dart';

// class HiBaseProvider<M extends HiModel> {

//   // static HiBaseProvider? _instance;
//   // static HiBaseProvider shared() {
//   //   _instance ??= HiBaseProvider._();
//   //   return _instance!;
//   // }

//   // HiBaseProvider._();

//   HiBaseProvider();

//   void test() {
//     var name = M.runtimeType.toString();
//     log('name = $name, type = ${M.runtimeType}');
//   }

//   // Future<void> prepare(name, String? createSql) async {
//   //   isTableExits = await HiDbManager.isTableExits(name);
//   //   if (!isTableExits) {
//   //     Database db = await HiDbManager.getCurrentDatabase();
//   //     return await db.execute(createSql!);
//   //   }
//   // }
//   Future<void> prepare<M extends HiModel>() async {
//     var name = M.runtimeType.toString();
//     log('name = $name');
//   }

// }