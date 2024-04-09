import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/currencies_bloc.dart';
import 'package:homework12/blocs/currencies_event.dart';
import 'package:homework12/data/currencies_repo.dart';

import '../../data/models/currency_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  CurrenciesRepo productsRepository=CurrenciesRepo();
  final Color color=Colors.black;
  final TextEditingController nameController=TextEditingController();
  final TextEditingController imageController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            ProductModel productModel1=ProductModel(
                color: color,
                description:descriptionController.text,
                productName: nameController.text,
                imageUrl: imageController.text,
                price: double.parse(priceController.text),
                dateTime: DateTime.now(),
                productId:'');
            Navigator.pop(context);
            context.read<CurrenciesBloc>().add(AddCurrenciesEvent(productModel1));
          }, icon: const Icon(Icons.check,))
        ],
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal:16,vertical:8),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18,
              ),
              controller: nameController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter product name',
                contentPadding: EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18,
              ),
              textInputAction: TextInputAction.done,
              controller: priceController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter product price',
                contentPadding: EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product price',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18,
              ),
              textInputAction: TextInputAction.done,
              controller:imageController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter product image address',
                contentPadding: EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product image address',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black,fontSize:18,
              ),
              textInputAction: TextInputAction.done,
              controller: descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter product description',
                contentPadding: EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product description',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}