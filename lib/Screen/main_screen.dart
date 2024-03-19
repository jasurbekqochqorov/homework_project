import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/Screen/widget/bottom_widget.dart';
import 'package:homework12/Screen/widget/numbers_widget.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:homework12/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> element = [
    AllIcon.C,
    AllIcon.present,
    AllIcon.remove,
  ];
  List<String> amallar = ['/', 'x', '-', '+', '='];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 154.getH(),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.getW()),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       context.watch<CalculatorViewModel>().result,
                //       style: AppTextStyle.interSemiBold.copyWith(fontSize: 40),
                //     )
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(context.watch<CalculatorViewModel>().k,
                      style: AppTextStyle.interBold.copyWith(fontSize: 42),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.getH(),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.getW()),
                  topRight: Radius.circular(20.getW()),
                ),
                color: const Color(0xFFE9F6FF)),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        ...List.generate(element.length, (index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.getW(), vertical: 30.getH()),
                              child: TextButton(
                                onPressed: () {
                                  context.read<CalculatorViewModel>().remove(index);
                                },
                                child: SvgPicture.asset(
                                  element[index],
                                  width: 20.getW(),
                                  height: 20.getH(),
                                ),
                              ));
                        })
                      ],
                    ),
                    const NumberWidget(number: 7),
                    const NumberWidget(number: 4),
                    const NumberWidget(number: 1),
                    const BottomWidget()
                  ],
                ),
                Column(
                  children: [
                    ...List.generate(amallar.length, (index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.getW(), vertical: 29.getH()),
                          child: TextButton(
                            onPressed: () {
                              context.read<CalculatorViewModel>().operation(amallar[index]);
                            },
                            child: Text(amallar[index], style: AppTextStyle.interBold.copyWith(
                                  fontSize: 25.getW(), color: Colors.blue),
                            ),
                          ));
                    })
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
