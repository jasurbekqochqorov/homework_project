import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/screens/time/start_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import '../../cubits/currency/time_cubit.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  TimeOfDay? timeOfDay;
  String k='Read Book';
  @override
  Widget build(BuildContext context) {
    const  List<String> list = [
      "Read book",
      "Travel",
      'Watch TV',
      'eat food',
      'Listen music'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back,color:Colors.black,),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:26,vertical:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter Your Time',style: AppTextStyle.interRegular.copyWith(
                  color: AppColors.black,fontSize:45
                ),),
                const SizedBox(height:20,),
                Container(
                  margin:const EdgeInsets.symmetric(horizontal:24),
                  width: double.infinity,
                  child: TextButton(onPressed:()async{
                    timeOfDay =await showTimePicker(
                      context: context,
                      initialEntryMode: TimePickerEntryMode.input,
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!,
                        );
                      },
                    );
                  },
                      style: TextButton.styleFrom(
                        backgroundColor:const Color(0xFF00696B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),
                      child: Text('Choose time',style: AppTextStyle.interBold.copyWith(
                        color: AppColors.white,fontSize: 16
                      ),)),
                ),
                const SizedBox(height:40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
                  child: CustomDropdown<String>(
                    hintText: 'Select job role',
                    items: list,
                    initialItem: list[0],
                    onChanged: (value) {
                      k=value;
                    },
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal:35,vertical:4),
                  child: Text('What you will be working on '),
                ),
                const SizedBox(height:40,),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextButton(
                        onPressed: ()async{
                          if(timeOfDay!=null && k.isNotEmpty){
                          context.read<TimeTaskCubit>().addHourMinute(hour:timeOfDay!.hour, minute:timeOfDay!.minute, taskName:k);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content:Text('Time Starting'))
                          );
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return StartScreen(timeOfDay: timeOfDay,l:k,);
                          }));
        
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content:Text('Time or task name did not enter')));
                          }
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: const Color(0xFF00696B)
                        ),
                        child: Text('Start',style: AppTextStyle.interMedium.copyWith(
                            color:Colors.white,fontSize:16),)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
