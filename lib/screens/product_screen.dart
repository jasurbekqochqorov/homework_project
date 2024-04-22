import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/screens/qr_scanner_screen.dart';
import 'package:homework12/screens/result_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/size/size_utils.dart';
import 'package:url_launcher/link.dart';
import '../bloc/product_bloc.dart';
import '../data/models/form_status.dart';
import '../data/models/product_model.dart';
import '../utils/styles/app_text_style.dart';
import 'add_product_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      appBar: AppBar(
        backgroundColor: AppColors.c_333333.withOpacity(0.84),
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QrScannerScreen(
                      barcode: (barcode) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(barcode.code.toString()),
                          ),
                        );
                        context.read<ProductBloc>().add(
                              AddProductEvent(
                                productModel: ProductModel(
                                  name: "Data",
                                  id: DateTime.now().microsecond,
                                  qrCode: barcode.code.toString(),
                                  description: DateTime.now().toString(),
                                ),
                              ),
                            );
                      },
                    );
                  },
                ),
              );
            },
            icon: SvgPicture.asset(AppImages.scaner),
          )
        ],
        elevation: 0,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state.status == FormStatus.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state.status == FormStatus.error) {
          return Center(
            child: Text(state.statusText),
          );
        }
        final GlobalKey globalKey = GlobalKey();
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                ProductModel productModel = state.products[index];
                final uri=Uri.parse(productModel.qrCode);
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.c_333333),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return ResultScreen(products: productModel,globalKey: globalKey,);
                          }));
                        },
                        icon: SvgPicture.asset(
                          AppImages.scaner,
                          width: 35.w,
                          height: 35.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Link(
                        uri:uri,
                        target:LinkTarget.defaultTarget,
                        builder: (context,openLink){
                          return Expanded(
                            child: TextButton(onPressed:openLink,child: Text(
                              maxLines: 2,
                              productModel.qrCode,
                              style: AppTextStyle.interSemiBold.copyWith(
                                  fontSize: 16.w, color: AppColors.white),
                            ),),
                          );
                        }
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                context.read<ProductBloc>().add(RemoveProductEvent(productId: productModel.id));
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          Text(
                            state.products[index].description
                                .substring(0, 16),
                            style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white, fontSize: 12.w),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )),
            SizedBox(
              width: width,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_FDB623
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return const AddProductScreen();
                    }));
                  }, child:  Text("Add",style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize:16
              ),)),
            ),
            SizedBox(height: 20.h,)
          ],
        );
      }),
    );
  }

}

//TextButton(
//                           onPressed: () {
//                             WidgetSaverService.openWidgetAsImage(
//                               context: context,
//                               widgetKey: _globalKey,
//                               fileId: productModel.qrCode,
//                             );
//                           },
//                           child: const Icon(Icons.share),
//                         ),
//                         TextButton(
//                           onPressed: () {
  //                             WidgetSaverService.saveWidgetToGallery(
  //                               context: context,
  //                               widgetKey: _globalKey,
  //                               fileId: productModel.qrCode,
  //                             );
//                           },
//                           child: const Icon(Icons.download),
//                         )
