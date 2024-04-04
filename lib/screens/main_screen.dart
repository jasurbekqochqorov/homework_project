import 'package:flutter/material.dart';
import 'package:homework12/screens/incomes/currencies_screen.dart';
import 'package:homework12/screens/time/save_screen.dart';
import 'package:homework12/utils/styles/app_text_style.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return const SaveScreen();
          }));
        }, child:Text('First Screen',style: AppTextStyle.interBold.copyWith(
          color: Colors.black,fontSize:24
        ),)),
         const SizedBox(height: 20,),
          TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const CurrenciesScreen();
            }));
          }, child:Text('Second Screen',style:AppTextStyle.interBold.copyWith(
            color: Colors.black,fontSize:24
          ),))
      ],),),
    );
  }
}
