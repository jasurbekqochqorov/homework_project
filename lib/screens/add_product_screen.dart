import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/bloc/product_bloc.dart';
import 'package:homework12/data/models/product_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import '../utils/size/size_utils.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_333333.withOpacity(0.84),
        title: Text('Add', style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.white, fontSize: 26
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          TextField(
            controller: controller,
            style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white, fontSize: 16
            ),
            decoration: InputDecoration(
                hintText: "write something",
                hintStyle: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white.withOpacity(0.5), fontSize: 16
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.white)
                )
            ),
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            width: width,
            child: TextButton(onPressed: () {
              context.read<ProductBloc>().add(AddProductEvent(
                  productModel: ProductModel(id:DateTime.now().microsecond,
                    name:"Data",
                    description:DateTime.now().toString(),
                    qrCode:controller.text,)));
              Navigator.pop(context);
            },
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.c_FDB623
                ),
                child: Text("Save", style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white, fontSize: 16
                ),)),
          )
        ],),
      ),
    );
  }
}
