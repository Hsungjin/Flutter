import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (direction) {
        context.readTodoCubit.addTodo();
        // context.readTodoBloc.add(TodoRemoveEvent(todo));
      },
      background: RoundedContainer(
          color: context.appColors.removeTodoBg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Width(20),
              Icon(EvaIcons.trash2Outline, color: Colors.white),
            ],
          )),
      secondaryBackground: RoundedContainer(
          color: context.appColors.removeTodoBg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(EvaIcons.trash2Outline, color: Colors.white),
              Width(20),
            ],
          )),
      child: RoundedContainer(
        margin: EdgeInsets.only(bottom: 6),
        color: context.appColors.itemBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            todo.dueDate!.relativeDays.text.make(),
            Row(
              children: [
                TodoStatusWidget(todo),
                Expanded(child: todo.title.text.size(20).medium.make()),
                IconButton(
                    onPressed: () {
                      context.readTodoCubit.editTodo(todo);
                      // context.readTodoBloc.add(TodoContentUpdateEvent(todo));
                    },
                    icon: Icon(EvaIcons.editOutline))
              ],
            )
          ],
        ).pOnly(top: 15, right: 15, left: 5, bottom: 10),
      ),
    );
  }
}
