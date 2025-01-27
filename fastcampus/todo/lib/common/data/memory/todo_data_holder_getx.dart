// import 'package:fast_app_base/common/data/memory/todo_data_norifier.dart';
// import 'package:fast_app_base/common/data/memory/todo_status.dart';
// import 'package:fast_app_base/screen/dialog/d_confirm.dart';
// import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:retrofit/retrofit.dart';
//
// import 'vo_todo.dart';
//
// class TodoDataHolder extends GetxController {
//   final RxList<Todo> todoList = <Todo>[].obs;
//
//   Future<void> changeTodoStatus(Todo todo) async {
//     switch (todo.status) {
//       case TodoStatus.incomplete:
//         todo.status = TodoStatus.ongoing;
//       case TodoStatus.ongoing:
//         todo.status = TodoStatus.complete;
//       case TodoStatus.complete:
//         final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
//         result?.runIfSuccess((data) {
//           todo.status = TodoStatus.incomplete;
//         });
//     }
//     todoList.refresh();
//     update();
//   }
//
//   Future<void> addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       todoList.add(Todo(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//         createdTime: DateTime.now(),
//         status: TodoStatus.incomplete,
//       ));
//       update();
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if (result != null) {
//       todo.title = result.text;
//       todo.dueDate = result.dateTime;
//       todoList.refresh();
//       update();
//     }
//   }
//
//   void removeTodo(Todo todo) async {
//     todoList.remove(todo);
//     todoList.refresh();
//     update();
//   }
// }
//
// mixin class TodoDataProvider {
//   late final TodoDataHolder todoData = Get.find();
// }
