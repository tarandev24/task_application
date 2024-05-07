import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_application/bloc/bloc.dart';
import 'package:task_application/screens/detailsListScreen.dart';

void main() {
  runApp(const TaskApplication());
}

class TaskApplication extends StatelessWidget {
  const TaskApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScreenBloc()..add(FetchData()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task Project',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
            ),
            initialRoute: DetailsListScreen.routeName,
            routes: {
              DetailsListScreen.routeName: (context) => const DetailsListScreen(),
            },
          ));
  }
}
