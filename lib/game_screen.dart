import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/number_square_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'blocs/game/game_bloc.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    // context.read<GameBloc>();
    // context.read<GameRepository>();
    super.initState();
  }

  int k = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is CheckWin) {
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
          if (state is CheckState) {
            debugPrint('Qaytdan chizildi:');
            return Column(
              children: [
                Text(
                  "${k}",
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.black, fontSize: 44),
                ),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
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
                                  ? Colors.white
                                  : Colors.brown,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),
                          onPressed: () {
                            setState(() {
                              k++;
                              context.read<GameBloc>().add(CheckBox(
                                    k: state.k,
                                    index: index,
                                  ));
                              context.read<GameBloc>().add(const Check());
                            });
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
