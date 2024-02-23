import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/TransactionsScreen/transaction_screen.dart';
import 'package:homework12/Screen/cardsScreen/card_screen.dart';
import 'package:homework12/Screen/homeScreen/home_screen.dart';
import 'package:homework12/Screen/profileScreen/profile_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/icons/icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
      body: _screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        onTap: (newActiveIndex){
          activeIndex=newActiveIndex;
          setState(() {});
        },
        currentIndex: activeIndex,
        type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.black,
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
