// import 'package:fast_app_base/common/data/memory/todo_data_norifier.dart';
// import 'package:fast_app_base/common/data/memory/todo_status.dart';
// import 'package:fast_app_base/screen/dialog/d_confirm.dart';
// import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'vo_todo.dart';
//
// class TodoDataHolder extends InheritedWidget {
//   final TodoDataNotifier notifier;
//
//   const TodoDataHolder({super.key, required super.child, required this.notifier});
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true;
//   }
//
//   static TodoDataHolder _of(BuildContext context) {
//     TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
//     return inherited;
//   }
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
//     notifier.notify();
//   }
//
//   Future<void> addTodo() async {
//     final result = await WriteTodoDialog().show();
//     if (result != null) {
//       notifier.addTodo(Todo(
//         id: DateTime.now().millisecondsSinceEpoch,
//         title: result.text,
//         dueDate: result.dateTime,
//         createdTime: DateTime.now(),
//         status: TodoStatus.incomplete,
//       ));
//     }
//   }
//
//   void editTodo(Todo todo) async {
//     final result = await WriteTodoDialog(todoForEdit: todo).show();
//     if(result != null) {
//       todo.title = result.text;
//       todo.dueDate = result.dateTime;
//       notifier.notify();
//     }
//   }
//
//   void removeTodo(Todo todo) async {
//     notifier.value.remove(todo);
//     notifier.notify();
//   }
// }
//
// extension TodoDateHolderContextExtension on BuildContext {
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }
