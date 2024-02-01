part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetTodo extends TodoEvent {}

class LoadTodo extends TodoEvent {
  final List<TodoModel> todos;

  const LoadTodo({this.todos = const <TodoModel>[]});

  @override
  List<Object> get props => [todos];
}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final TodoModel todo;

  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final TodoModel todo;

  const DeleteTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
