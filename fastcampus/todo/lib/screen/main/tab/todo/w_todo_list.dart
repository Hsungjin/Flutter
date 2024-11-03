import 'package:fast_app_base/common/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/common/data/memory/todo_cubit.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// class TodoList extends StatelessWidget with TodoDataProvider {
//   TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => todoData.todoList.isEmpty
//         ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//         : Column(
//             children: todoData.todoList.map((e) => TodoItem(e)).toList(),
//           ));
//   }
// }

// class TodoList extends GetView<TodoDataHolder> {
//   TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => controller.todoList.isEmpty
//         ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//         : Column(
//       children: controller.todoList.map((e) => TodoItem(e)).toList(),
//     ));
//   }
// }

// class TodoList extends StatelessWidget {
//   TodoList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TodoDataHolder>(
//       builder: (todoData) {
//         return todoData.todoList.isEmpty
//             ? '할일을 작성해보세요.'.text.size(30).makeCentered()
//             : Column(
//                 children: todoData.todoList.map((e) => TodoItem(e)).toList(),
//               );
//       },
//     );
//   }
// }

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoBlocState>(builder: (context, state) {
      return state.todoList.isEmpty
            ? '할일을 작성해보세요.'.text.size(30).makeCentered()
            : Column(
                children: state.todoList.map((e) => TodoItem(e)).toList(),
              );
    });
  }
}
