import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/countries_bloc.dart';
import 'package:homework12/countries_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              context.read<CountriesBloc>().add(FetchCountries(qit: 'AS'));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('Asia',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24),)),
            TextButton(onPressed: (){
              context.read<CountriesBloc>().add(FetchCountries(qit: 'EU'));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('Europa',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24))),
            TextButton(onPressed: (){
              context.read<CountriesBloc>().add(FetchCountries(qit: 'SA'));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('Sourth America',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24))),
            TextButton(onPressed: (){
              context.read<CountriesBloc>().add(FetchCountries(qit: 'AF'));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('Africa',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24))),
            TextButton(onPressed: (){
              context.read<CountriesBloc>().add(FetchCountries(qit: 'NA'));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('North America',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24))),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return const CountriesScreen();
              }));
            }, child:Text('All',style: AppTextStyle.interMedium.copyWith(color: AppColors.black,fontSize: 24))),
          ],
        ),
      ),
    );
  }
}
