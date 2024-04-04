import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/country_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import 'country_screen.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // context.read<CurrencyRepository>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          "Countries",
          style: AppTextStyle.interBold
              .copyWith(color: AppColors.black, fontSize: 18),
        ),
      ),
      body: BlocBuilder<CurrencyCubit,CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrencyErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorText),
              ],
            );
          } else if (state is CurrencySuccessState) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              children: List.generate(state.currencies.length, (index) {
                IncomesModel incomesModel = state.currencies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CountryScreen(incomesModel:incomesModel);
                      }));
                    },
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text(
                          incomesModel.data[0].sender.name,
                          style: AppTextStyle.interMedium
                              .copyWith(color: AppColors.black, fontSize: 20),
                        )),
                        const Spacer(),
                        Text(incomesModel.data[0].sender.location,
                            style: AppTextStyle.interMedium
                                .copyWith(color: AppColors.black, fontSize: 16))
                      ],
                    ),
                  ),
                );
              }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
