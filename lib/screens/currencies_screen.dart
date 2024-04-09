import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/screens/add_screen/add_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../blocs/currencies_bloc.dart';
import '../blocs/currencies_state.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';
import 'about_screen/about_screen.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({super.key});

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocConsumer<CurrenciesBloc, CurrenciesState>(
          builder: (context, state) {
            if (state is CurrenciesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CurrenciesErrorState) {
              return Center(
                child: Text(state.errorText),
              );
            }
            if (state is CurrenciesSuccessState) {
              return GridView.count(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical:40),
                mainAxisSpacing:16,
                //vertically
                crossAxisSpacing:10,
                //horizontally
                crossAxisCount: 2,
                childAspectRatio:0.7,
                children: [
                  ...List.generate(
                    state.currencies.length,
                        (index) =>ZoomTapAnimation(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return AboutProductScreen(productModel: state.currencies[index],);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow:const[
                            BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0,4)
                            )
                          ],
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:8,),
                            Center(child: Image.network(state.currencies[index].imageUrl,width: 140,height:140,fit: BoxFit.cover,)),
                            const Spacer(),
                            Text("name:${state.currencies[index].productName}",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize: 20
                            ),),
                            SizedBox(height: 4,),
                            Text("Price:${state.currencies[index].price.toString()}",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.black,fontSize: 18
                            ),),
                            SizedBox(height:10,)
                          ],),
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          }, listener: (BuildContext context, CurrenciesState state) { },
      ),
    floatingActionButton: FloatingActionButton(
      child:const Icon(Icons.add),
    onPressed: ()async{
    Navigator.push(context,MaterialPageRoute(builder: (context){
    return const AddScreen();
    }));
    },
    //       listener: (context, state) {}),
    ));
  }
}
