import 'package:dialogue_player/data/repositories/data_repository.dart';
import 'package:dialogue_player/logic/bloc/dialog_bloc.dart';
import 'package:dialogue_player/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DialoguePlayer());
}

class DialoguePlayer extends StatelessWidget {
  const DialoguePlayer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(),
      child: BlocProvider(
        create: (context) =>
            DialogBloc(context.read<DataRepository>())..add(FetchData()),
        child: MaterialApp(
          title: 'DialoguePlayer',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: const HomePage(title: 'DialoguePlayer'),
        ),
      ),
    );
  }
}
