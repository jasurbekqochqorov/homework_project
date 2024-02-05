
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key, required this.title, required this.icon,this.icon2=false,this.bool1=false});
  final String title;
  final String icon;
  final bool? icon2;
  final bool? bool1;
  @override
  State<ListTileWidget> createState() => _LisTileWidgetState();
}

class _LisTileWidgetState extends State<ListTileWidget> {
  bool k=true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left:1),
      onTap: (){
        k=!k;
        setState(() {
        });
      },
      leading: SvgPicture.asset(widget.icon),
      title:Text(widget.title,style: AppTextStyle.interBold.copyWith(
          color: AppColors.c_0D2333,fontSize: 18
      ),),
      trailing:!(widget.icon2!)?Switch(

        activeTrackColor: AppColors.black,
        value:(widget.title=='Dark Theme')?!k:k, onChanged: (bool value) {
        k=!k;

        setState(() {
        });
      },
      ):IconButton(onPressed:(){}, icon:SvgPicture.asset(AllIcon.arrowForward)),
    );
  }
}
