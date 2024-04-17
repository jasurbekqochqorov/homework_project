import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title:Text('Continent',style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.black,fontSize:24
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'AS'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: "Asia",);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('Asia',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24),)),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width:double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'EU'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'Europa',);
                  }));
                },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('Europa',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'SA'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'South America',);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('South America',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'AF'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'Africa',);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('Africa',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'NA'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'North America',);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('North America',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: 'OC'));
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'Australia',);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('Australia',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){
                  context.read<CountriesBloc>().add(FetchCountries(qit: ''));
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return const CountriesScreen(continent: 'All',);
                  }));
                },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.c_1A72DD
                    ),
                    child:Text('All',style: AppTextStyle.interMedium.copyWith(color: AppColors.white,fontSize: 24))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
