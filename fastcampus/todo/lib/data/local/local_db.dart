import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/local/collection/todo_db_model.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';


import '../../data/local/error/local_db_error.dart';

class LocalDB {
// class LocalDB implements TodoRepository<LocalDBError> {
//   static late final Isar _isar;

//   LocalDB._();

//   static LocalDB instance = LocalDB._();

//   static Future<void> init() async {
//     _isar = await Isar.open([TodoDbModelSchema], maxSizeMiB: 512, directory: dir.path);
//   }

//   @override
//   Future<SimpleResult<List<Todo>, LocalDBError>> getDocuments() async {
//     try {
//       debugPrint('get response success');
//       final documents = await _isar.todoDbModels.filter().idGreaterThan(0).findAll();
//       return SimpleResult.success(documents.map((e) => Todo.fromDB(e)).toList());
//   } catch (e) {
//     debugPrint('get response fail');
//     return SimpleResult.failure(
//       LocalDBError(LocalDBErrorType.unknown, e.toString()),
//     );
//   }
// }

//   @override
//   Future<SimpleResult<void, LocalDBError>> addDocument(Todo document) async {
//     final documents = await _isar.todoDbModels.filter().imageUrlMatches(document.imageUrl).findAll();
//     if (documents.isNotEmpty) {
//       debugPrint('already exist');
//     return Result.failure(LocalDBError(LocalDBErrorType.alreadyExist, 'Document is already exist'));
//   }

//   final localDocument = document.toLocalDocument();
//   await _isar.writeTxn(() async {
//     await _isar.localDocuments.put(localDocument);
//   });
//   return Result.success();
// }

//   @override
//   Future<SimpleResult<void, LocalDBError>> removeDocument(ImageUrlProvider document) async {
//     final documents = await _isar.localDocuments.filter().imageUrlMatches(document.imageUrl).findAll();
//     if (documents.isEmpty) {
//       debugPrint('Not exist');
//     return Result.failure(LocalDBError(LocalDBErrorType.notExist, 'Document is not exist'));
//   }
//   await _isar.writeTxn(() async {
//     await _isar.localDocuments.delete(documents[0].id);
//   });
//   return Result.success();
// }
}
