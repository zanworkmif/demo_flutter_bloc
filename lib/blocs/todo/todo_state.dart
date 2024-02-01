part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  const TodoLoaded({this.todos = const <TodoModel>[]});

  @override
  List<Object> get props => [todos];
}

class TodoError extends TodoState {
  final String? errorMessage;

  const TodoError(this.errorMessage);
}
