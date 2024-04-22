import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:homework12/data/models/product_model.dart';
import 'package:homework12/utils/size/size_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/widget_saver_service.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key, required this.product, required this.globalKey});

  final GlobalKey globalKey;
  final ProductModel product;

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.c_FDB623,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.c_333333.withOpacity(0.84),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.c_000000.withOpacity(0.2)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Data',
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.white, fontSize: 16.w),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  widget.product.qrCode,
                  style: AppTextStyle.interRegular
                      .copyWith(color: AppColors.white, fontSize: 12.w),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          RepaintBoundary(
            key: widget.globalKey,
            child: QrImageView(
              backgroundColor: AppColors.white,
              data: widget.product.qrCode,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    WidgetSaverService.openWidgetAsImage(
                      context: context,
                      widgetKey: widget.globalKey,
                      fileId:widget.product.qrCode,
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_FDB623,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 14)),
                  child: const Icon(
                    Icons.share,
                    color: AppColors.c_000000,
                  )),
              SizedBox(
                width: 30.w,
              ),
              TextButton(
                  onPressed: () {
                    WidgetSaverService.saveWidgetToGallery(
                      context: context,
                      widgetKey: widget.globalKey,
                      fileId: widget.product.qrCode,
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.c_FDB623,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 14)),
                  child: const Icon(
                    Icons.save,
                    color: AppColors.c_000000,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
