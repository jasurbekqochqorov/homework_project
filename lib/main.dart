import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/note/card_bloc.dart';
import 'package:homework12/screens/note/notes_screen.dart';

import 'blocs/note/card_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>
        NoteBloc()
          ..
          add(GetNotesEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(useMaterial3: false),
      home: const NotesScreen(),
    );
  }
}
