import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/local/local_database.dart';

import '../../blocs/connectivity/connectivity_bloc.dart';
import '../../blocs/connectivity/connectivity_state.dart';
import '../../blocs/currency/currency_bloc.dart';
import '../../blocs/currency/currency_event.dart';
import '../../data/models/currency_model.dart';
import '../../utils/styles/app_text_style.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key, required this.onInternetComeBack})
      : super(key: key);
  final VoidCallback onInternetComeBack;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  // bool canPop = false;
  List<CurrencyModel> currency=[];
  init()async{
    currency=await LocalDatabase.getAllCurrency();
  }
  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        debugPrint("ON POP INVOKED:$value");
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text("INTERNET O'CHIQ HOLATDA"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child:ListView(
                children: List.generate(currency1.length, (index) {
                  CurrencyModel currencyModel =currency1[index];
                  return ListTile(
                    onTap: () {
                      context.read<CurrencyBloc>().add(DeleteCurrencyEvent(
                          currencyId: currencyModel.title));
                    },
                    title: Text(
                        "${currencyModel.title} ${currencyModel.date}"),
                    subtitle: Text("Qiymati:${currency.length}"),
                  );
                }),
              ),
            ),
            BlocListener<ConnectivityBloc, ConnectivityState>(
              listener: (context, state) {
                if (state.hasInternet) {
                  widget.onInternetComeBack.call();
                  Navigator.pop(context);
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
