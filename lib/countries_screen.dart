import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/utils/colors/app_colors.dart';

import 'blocs/countries_bloc.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("EUROPE COUNTRIES"),
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
                      context.read<CountriesBloc>().add(FetchCountries(search: v));
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
                        trailing: Text(state.countries[index].emoji),
                        // subtitle: Text(state.countries[index].continentName),
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
