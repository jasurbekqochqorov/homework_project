import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/cubit/counter_cubit.dart';
import 'package:homework12/data/models/number_square_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/size/size_utils.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'blocs/game/game_bloc.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state){

          if (state.isWin) {
            return Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Do you want play again',
                        style: AppTextStyle.interMedium
                            .copyWith(color: AppColors.black, fontSize: 18),
                      ))
                ],
              ),
            );
          }
          else {
            return Column(
              children: [
                BlocBuilder<CounterCubit,int>(
                  builder: (context1,state){
                    return Column(
                      children: [
                        Text(
                          "$state",
                          style: AppTextStyle.interMedium
                              .copyWith(color: AppColors.black, fontSize: 44),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        TextButton(onPressed:(){
                          context1.read<CounterCubit>().empty();
                          context.read<GameBloc>().add(GetAllNumber());
                        }, child:Text("${state}Again")),
                      ],
                    );
                  },
                ),
                Container(
                  height:height*0.47,
                  color: AppColors.black,
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(state.allNumbers.length, (index) {
                      NumberSquareModel questions = state.allNumbers[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: (questions.isFilled)
                                  ?null
                                  : Colors.brown,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            setState(() {});
                            context.read<CounterCubit>().increment();
                              context.read<GameBloc>().add(CheckWins(questions:state.allNumbers,index:index));
                          },
                          child: Text(
                            questions.number,
                            style: AppTextStyle.interMedium
                                .copyWith(color: AppColors.white, fontSize: 19),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            );
          }
          debugPrint(state.toString());
          return SizedBox();
        },
      ),
    );
  }
}
