import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/cubits/currency/time_cubit.dart';
import 'package:homework12/data/models/time_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key,this.timeOfDay, this.l});
  final TimeOfDay? timeOfDay;
  final String? l;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {

      Future.microtask(() {
        context.read<TimeTaskCubit>().startTime();
      });
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TimeTaskCubit,TimeTaskState>(
        builder: (BuildContext context,TimeTaskState state){
          if(state.minute==0 &&  state.hour==0 && state.second==0){
            Navigator.pop(context);
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height:100,),
                  Stack(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          value: state.progressValue,
                          color: const Color(0xFF00696B),
                          backgroundColor: Colors.blueGrey.withOpacity(0.4),
                          strokeWidth: 8,
                        ),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 110,
                        child: RichText(
                          text: TextSpan(
                              text: state.hour
                                  .toString()
                                  .length == 1
                                  ? "0${state.hour.toString()}"
                                  : state.hour.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40
                              ),
                              children: [
                                TextSpan(
                                    text: state.minute
                                        .toString()
                                        .length == 1 ? " : 0${state.minute
                                        .toString()} : " : " : ${state.minute
                                        .toString()} : ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40
                                    )
                                ),
                                TextSpan(
                                    text: state.second
                                        .toString()
                                        .length == 1 ? "0${state.second
                                        .toString()}" : state.second
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40
                                    )
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Text(state.taskName,style: AppTextStyle.interBold.copyWith(
                    color: AppColors.black,fontSize:24
                  ),)
                ],),
            ),
          );
        }
      )
    );
  }
}
