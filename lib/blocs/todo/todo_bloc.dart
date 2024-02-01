import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_flutter_bloc/data/models/todo_model.dart';
import 'package:demo_flutter_bloc/data/repositories/todo_repos.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;

  TodoBloc(this._todoRepository) : super(TodoInitial()) {
    on<LoadTodo>(_onLoadTodo);
  }

  FutureOr<void> _onLoadTodo(LoadTodo event, Emitter<TodoState> emit) async {
    emit(TodoInitial());
    try {
      final todos = await _todoRepository.getTodo();
      emit(TodoLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
