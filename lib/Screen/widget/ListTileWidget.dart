import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';
import '../main_screen.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key,required this.address, required this.title, required this.i});
 final String address;
 final String title;
 final int i;
  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}


class _ListTileWidgetState extends State<ListTileWidget> {
  String character='';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(width:1,color: AppColors.c_090F47.withOpacity(0.45))
      ),
      contentPadding: EdgeInsets.only(left:8.getW(),top: 16.getH(),bottom: 16.getH(),right: 12.getW()),
      leading:Radio<String>(
        value:(widget.i==1)?'Home':'Office',
        groupValue:character,
        onChanged: (String? value){
          character=value!;
          setState(() {
          });
        },
      ),
      title:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_090F47,fontSize: 14
          ),),
          Text('(205) 555-024',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_090F47.withOpacity(0.45),fontSize: 13
          ),),
          Text(widget.address,style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_090F47.withOpacity(0.45),fontSize: 13
          ),)
        ],),
      trailing: IconButton(onPressed:(){},icon:SvgPicture.asset(AllIcon.pen),),
    );
  }
}


//Radio<WeekDay>(
//                 value: list[index],
//                 groupValue: _character,
//                 onChanged: (WeekDay? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),