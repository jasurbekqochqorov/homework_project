import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/game/game_bloc.dart';
import 'package:homework12/game/game_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
        centerTitle: true,
      ),
      body:BlocBuilder<GameBloc,GameState>(
        builder: (context,state){
         if(state is CurrencySuccessState) {
           return const Column(children: [
             Text('dasfffffff')
           ],);
         }
         return const SizedBox();
        }
      )
    );
  }
}
