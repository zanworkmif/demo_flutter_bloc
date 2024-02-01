import 'package:demo_flutter_bloc/blocs/todo/todo_bloc.dart';
import 'package:demo_flutter_bloc/data/repositories/todo_repos.dart';
import 'package:demo_flutter_bloc/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => TodoRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  TodoBloc(RepositoryProvider.of<TodoRepository>(context))
                    ..add(const LoadTodo()),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
