import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:my_utils/my_utils.dart';

import '../../blocs/connectivity/connectivity_bloc.dart';
import '../../blocs/connectivity/connectivity_state.dart';
import '../../blocs/currency/currency_bloc.dart';
import '../../blocs/currency/currency_event.dart';
import '../../blocs/currency/currency_state.dart';
import '../../data/models/currency_model.dart';
import '../no_internet/no_internet_screen.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({super.key});

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Currencies")),
      body: Column(
        children: [
          BlocBuilder<CurrencyBloc, CurrencyState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is CurrencyLoadingState) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is CurrencyErrorState) {
                return Center(child: Text(state.errorText),);
              } else if (state is CurrencySuccessState) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.currencies.length, (index) {
                      CurrencyModel currencyModel = state.currencies[index];
                      return ListTile(
                        onTap: () {
                          context.read<CurrencyBloc>().add(DeleteCurrencyEvent(
                              currencyId: currencyModel.title));
                        },
                        title: Text(
                            "${currencyModel.title} ${currencyModel.date}",style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.black,fontSize: 18
                        ),),
                        subtitle: Text("Qiymati: ${currencyModel.cbPrice} UZS",style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.black,fontSize: 14
                        ),),
                      );
                    }),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          // BlocListener<CurrencyBloc, CurrencyState>(
          //   listener: (context, state) {
          //     if (state is CurrencySuccessState) {
          //       if (state.currencies.isNotEmpty) {
          //         //  Navigator.
          //       }
          //     }
          //
          //     if (state is CurrencyDeletedState) {
          //       Future.microtask(
          //         () => ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             duration: Duration(seconds: 1),
          //             content: Text("DELETED"),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   child: Container(
          //     height: 300,
          //     color: Colors.red,
          //     width: double.infinity,
          //   ),
          // )

          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (context, state){
              if (!state.hasInternet) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NoInternetScreen(
                        onInternetComeBack: () {
                          context
                              .read<CurrencyBloc>()
                              .add(GetCurrenciesEvent());
                        },
                      );
                    },
                  ),
                );
              }
            },
            child: const SizedBox(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
