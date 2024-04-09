import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/currencies_bloc.dart';
import 'package:homework12/blocs/currencies_event.dart';
import 'package:homework12/data/currencies_repo.dart';

import '../../data/models/currency_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../update/update_screen.dart';

class AboutProductScreen extends StatefulWidget {
  const AboutProductScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<AboutProductScreen> createState() => _AboutProductScreenState();

}

class _AboutProductScreenState extends State<AboutProductScreen> {
  CurrenciesRepo productsRepository=CurrenciesRepo();

  _init(){
    setState(() {});
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,color: Colors.blue,),
        ),
        title:Text("About product",style: AppTextStyle.interMedium.copyWith(
            color: Colors.blue,fontSize: 22
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder:(context){
              return AlertDialog(
                title: Text("Would you like to delete this product",style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black,fontSize:18
                ),),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:Text("No",style:AppTextStyle.interMedium.copyWith(
                      color: AppColors.black,fontSize:18
                  ),)),
                  TextButton(onPressed: ()async{
                    context.read<CurrenciesBloc>().add(DeleteCurrenciesEvent(widget.productModel.productId));
                    setState(() {});
                    Navigator.pop(context);
                    Navigator.pop(context);
                    setState(() {});
                  }, child:Text("Yes",style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.black,fontSize:18
                  ),)),
                ],
              );
            });
            setState(() {});
          }, icon:const Icon(Icons.delete,color: Colors.red,)),
          IconButton(onPressed: (){
            _init();
          }, icon:const Icon(Icons.refresh,color:Colors.blue,))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical:20,horizontal:30),
                        child: Image.network(widget.productModel.imageUrl)),
                    SizedBox(height: 20,),
                    RichText(
                        text:TextSpan(
                            text:"Name: ",
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize:20
                            ),
                            children: [
                              TextSpan(
                                  text: widget.productModel.productName,
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.black,fontSize:20
                                  )
                              )
                            ]
                        )
                    ),
                    SizedBox(height:10,),
                    RichText(
                        text:TextSpan(
                            text:"Price: ",
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize:20
                            ),
                            children: [
                              TextSpan(
                                  text: "${widget.productModel.price}\$",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.black,fontSize:20
                                  )
                              )
                            ]
                        )
                    ),
                    SizedBox(height:10,),
                    RichText(
                        text:TextSpan(
                            text:"Description: ",
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize:20
                            ),
                            children: [
                              TextSpan(
                                  text: widget.productModel.description,
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.black,fontSize:20
                                  )
                              )
                            ]
                        )
                    ),
                  ],),),
            ),
          ),
          // ),Spacer(),
          Container(
              margin: EdgeInsets.symmetric(horizontal:10),
              width: double.infinity,
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UpdateScreen(productModel: widget.productModel,onUpdate:(){
                    setState(() {});
                  },);
                }));
              },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical:8),
                      backgroundColor:Colors.blue
                  ),
                  child: Text('Update product',style:AppTextStyle.interMedium.copyWith(
                      color: AppColors.white,fontSize:20
                  ),))),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}