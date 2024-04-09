import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/currencies_bloc.dart';
import 'package:homework12/blocs/currencies_event.dart';
import 'package:homework12/utils/size/size_utils.dart';
import '../../data/models/currency_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.productModel, required this.onUpdate});
  final ProductModel productModel;
  final VoidCallback onUpdate;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  // CurrenciesRepo productsRepository=CurrenciesRepo();
  final Color color=Colors.black;
  final TextEditingController nameController=TextEditingController();
  final TextEditingController imageController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController descriptionController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Products"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            ProductModel productModel=ProductModel(
                color: color,
                description:descriptionController.text==""?widget.productModel.description:descriptionController.text,
                productName: nameController.text==""?widget.productModel.productName:nameController.text,
                imageUrl: imageController.text==""?widget.productModel.imageUrl:imageController.text,
                price:priceController.text==""?widget.productModel.price:double.parse(priceController.text),
                dateTime: DateTime.now(),
                productId:widget.productModel.productId);
            context.read<CurrenciesBloc>().add(UpdateCurrenciesEvent(productModel));
            Navigator.pop(context);
            Navigator.pop(context);
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
                labelText: 'Enter other product name',
                contentPadding: const EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product name',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
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
                labelText: 'Enter other product price',
                contentPadding: EdgeInsets.symmetric(vertical:16.h,horizontal:10.w),
                // hintText: 'Enter product price',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width:1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
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
                labelText: 'Enter ohter product image address',
                contentPadding: const EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product image address',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
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
                labelText: 'Enter other product description',
                contentPadding:const EdgeInsets.symmetric(vertical:16,horizontal:10),
                // hintText: 'Enter product description',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.c_2A3256),
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