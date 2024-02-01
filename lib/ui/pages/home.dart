import 'package:demo_flutter_bloc/blocs/todo/todo_bloc.dart';
import 'package:demo_flutter_bloc/ui/widgets/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter Bloc'),
          backgroundColor: Colors.amber[400]),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          print(state);
          if (state is TodoInitial) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            );
          }
          if (state is TodoLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ...state.todos.map(
                      (task) => InkWell(
                        onTap: (() {
                          context.read<TodoBloc>().add(UpdateTodo(
                              todo:
                                  task.copyWith(isComplete: !task.isComplete)));
                        }),
                        child: TaskWidget(
                          task: task,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            );
          }

          if (state is TodoError) {
            return const Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Error Saat Load Data')]),
            );
          }

          return Container();
        },
      ),
    );
  }
}
