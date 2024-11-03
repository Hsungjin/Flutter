import 'package:fast_app_base/common/data/memory/vo_todo.dart';

abstract class TodoEvent {

}

class TodoAddEvent extends TodoEvent{}

class TodoStatusUpdeateEvent extends TodoEvent{
  final Todo updatedTodo;

  TodoStatusUpdeateEvent(this.updatedTodo);
}

class TodoContentUpdateEvent extends TodoEvent{
  final Todo updatedTodo;

  TodoContentUpdateEvent(this.updatedTodo);
}

class TodoRemoveEvent extends TodoEvent{
  final Todo removedTodo;

  TodoRemoveEvent(this.removedTodo);
}