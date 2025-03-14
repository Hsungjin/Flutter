import 'package:fast_app_base/common/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/common/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/common/data/memory/todo_data_holder_getx.dart';
import 'package:fast_app_base/common/data/memory/todo_data_norifier.dart';
import 'package:fast_app_base/common/data/memory/todo_status.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

import 'bloc/bloc_status.dart';
import 'vo_todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  TodoBloc() : super(const TodoBlocState(BlocStatus.inital, <Todo>[])){
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdeateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemoveEvent>(_removeTodo);
  }

  Future<void> _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      final copiedOldTodoList = List.of(state.todoList);
      copiedOldTodoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      ));
      emitNewList(copiedOldTodoList, emit);
    }
  }

  Future<void> _changeTodoStatus(TodoStatusUpdeateEvent event, Emitter<TodoBlocState> emit) async {
    final copiedOldTodoList = List.of(state.todoList);
    final todo = event.updatedTodo;
    final todoIndex = copiedOldTodoList.indexWhere((element) => element.id == todo.id);

    TodoStatus status = todo.status;

    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          status = TodoStatus.incomplete;
        });
    }
    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(copiedOldTodoList, emit);
  }

  void _editTodo(TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.updatedTodo;
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo.copyWith(title: result.text, dueDate: result.dateTime, modifyTime: DateTime.now());
      emitNewList(oldCopiedList, emit);
    }
  }

  void _removeTodo(TodoRemoveEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.removedTodo;
    final oldCopiedList = List<Todo>.from(state.todoList);
    oldCopiedList.removeWhere((element) => element.id == todo.id);
    emitNewList(oldCopiedList, emit);
  }

  void emitNewList(List<Todo> oldCopiedList, Emitter<TodoBlocState> emit) {
    emit(state.copyWith(todoList: oldCopiedList));
  }
}
