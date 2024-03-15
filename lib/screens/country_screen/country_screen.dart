import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/country_model.dart';
import 'package:flutter_nt_ten/view_model/country_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: context.watch<CountriesViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ...List.generate(
                    context.watch<CountriesViewModel>().countries.length,
                    (index) {
                  CountryModel country =
                      context.watch<CountriesViewModel>().countries[index];
                  debugPrint(country.name['common']);

                  return ListTile(
                    title: Text(country.name['common']),
                    subtitle: Text(country.capital.toString()),
                    leading: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                        child: Image.network(country.flag['png'],
                        height: 40.h,
                          width: 70.w,
                        )),
                    trailing: Text(country.population.toString()),
                  );
                })
              ],
            ),
    );
  }
}
