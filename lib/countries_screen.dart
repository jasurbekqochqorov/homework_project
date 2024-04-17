import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import 'blocs/countries_bloc.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key, required this.continent});
  final String continent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title:Text(continent,style:AppTextStyle.interMedium.copyWith(
          color: AppColors.black,fontSize:24
        ),),
        centerTitle: true,
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesError) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is CountriesSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (v){
                      String qit='';
                        if(continent=='Australia'){
                          qit='OC';
                        }
                      else if(continent!='All'){
                        qit=continent.toUpperCase().substring(0,2);
                      }
                      context.read<CountriesBloc>().add(FetchCountries(search: v,qit:qit));
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical:10),
                      border:OutlineInputBorder(
                        borderSide: const BorderSide(width: 1,color:AppColors.black),
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal:12),
                    children: List.generate(
                      state.countries.length,
                      (index) => ListTile(
                        title: Text(state.countries[index].name),
                        titleTextStyle: AppTextStyle.interMedium.copyWith(
                          color: AppColors.black,fontSize:20
                        ),
                        trailing: Text(state.countries[index].emoji,style: AppTextStyle.interMedium.copyWith(
                          fontSize: 24
                        ),),
                        subtitle: Text(state.countries[index].continentName,style: AppTextStyle.interRegular.copyWith(
                          color: AppColors.black,fontSize: 16
                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
