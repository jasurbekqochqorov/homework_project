import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/game/game_bloc.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:homework12/utils/colors/app_colors.dart';
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    context.read<GameBloc>().add(LoadQuestions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("GAME"),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          debugPrint("index${state.currentQuestionIndex}");
          debugPrint("All question${state.allQuestions.length}");
          return state.allQuestions.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        '${state.currentQuestionIndex + 1}-savol ',
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.4,
                      children: List.generate(
                          state.allQuestions[state.currentQuestionIndex].images.length, (index) {
                        String img = state.allQuestions[state.currentQuestionIndex].images[index];
                        return Image.asset(img,fit: BoxFit.cover,);
                      }),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Row(children: [
                        ...List.generate(state.allQuestions[state.currentQuestionIndex].answer.length, (index){
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal:4),
                            width: 35,height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(color: Colors.blue,width: 1)
                            ),
                            child: (state.enteredAnswer.length>index)?Center(
                              child: Text(state.enteredAnswer[index],style: AppTextStyle.interMedium.copyWith(
                                color: Colors.black,fontSize: 22,
                              ),),
                            ):const Text(''),
                          );
                        }),
                        const Spacer(),
                        TextButton(onPressed: (){
                          context.read<GameBloc>().add( RemoveLetter(letter: state.enteredAnswer));
                        }, child:const Icon(Icons.cancel_rounded))
                      ],),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 6,
                      children: List.generate(
                        state.lettersList.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: TextButton(
                                onPressed: () {
                                  context.read<GameBloc>().add(
                                      CollectEnteredLetter(
                                          state.lettersList[index]));
                                },
                                child: Text(
                                  state.lettersList[index].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          );
                        },
                      ),
                    ))
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GameBloc>().add(const NextQuestions());
        },
        child: const Text('NEXT'),
      ),
    );
  }
}
