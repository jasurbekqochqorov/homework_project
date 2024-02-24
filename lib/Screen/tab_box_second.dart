import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/TransactionsScreen/transaction_screen.dart';
import 'package:homework12/Screen/cardsScreen/card_screen.dart';
import 'package:homework12/Screen/homeScreen/home_screen.dart';
import 'package:homework12/Screen/profileScreen/profile_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class TabBoxSecond extends StatefulWidget {
  const TabBoxSecond({super.key});

  @override
  State<TabBoxSecond> createState() => _TabBoxSecondState();
}

class _TabBoxSecondState extends State<TabBoxSecond> {
  List<Widget> _screens = [];
  int activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const CardScreen(),
      const TransactionScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activeIndex,
        children:_screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        onTap: (newActiveIndex){
          activeIndex=newActiveIndex;
          setState(() {});
        },
        currentIndex: activeIndex,
        type:BottomNavigationBarType.fixed,
        unselectedLabelStyle: AppTextStyle.interMedium.copyWith(
            color: AppColors.white.withOpacity(0.6)
        ),
        selectedLabelStyle: AppTextStyle.interMedium.copyWith(
            color: AppColors.white.withOpacity(0.6)
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(AllIcon.home,colorFilter:ColorFilter.mode(AppColors.blue,BlendMode.srcIn),),
            icon: SvgPicture.asset(AllIcon.home),
            label:'home',

          ),
          BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(AllIcon.card,colorFilter:ColorFilter.mode(AppColors.blue,BlendMode.srcIn),),
            icon: SvgPicture.asset(AllIcon.card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(AllIcon.transaction
              ,colorFilter:ColorFilter.mode(AppColors.blue,BlendMode.srcIn),),
            icon: SvgPicture.asset(AllIcon.transaction,colorFilter:ColorFilter.mode(AppColors.c_8D8D8D,BlendMode.srcIn)),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(AllIcon.profile,colorFilter:ColorFilter.mode(AppColors.blue,BlendMode.srcIn),),
            icon: SvgPicture.asset(AllIcon.profile),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
