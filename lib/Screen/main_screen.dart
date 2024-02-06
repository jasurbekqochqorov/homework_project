import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Address> list = [
    Address(address: 'Home', location: '1786 Wheeler Bridge'),
    Address(address: 'Office', location: '1786 w Dallas St underfield'),
  ];
  List<PaymentMethod> list2 = [
    PaymentMethod(title: 'Credit card', image: AllIcon.card),
    PaymentMethod(title: 'Paypal', image: AllIcon.paypal),
    PaymentMethod(title: 'Google pay', image: AllIcon.google),
    PaymentMethod(title: 'Apple pay', image: AllIcon.apple),
  ];
  late Address? character;
  late PaymentMethod? character2;

  @override
  void initState() {
    character = list[0];
    character2 = list2[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AllIcon.arrowBack),
        ),
        title: Text(
          'Checkout',
          style: AppTextStyle.interBold
              .copyWith(color: AppColors.c_090F47, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 27.getW(), right: 24.getW(), top: 5.getH()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 Items in your cart',
                    style: AppTextStyle.interRegular.copyWith(
                      color: AppColors.c_090F47.withOpacity(0.45),
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'TOTAL',
                        style: AppTextStyle.interRegular.copyWith(
                            color: AppColors.c_090F47.withOpacity(0.45),
                            fontSize: 13),
                      ),
                      Text(
                        '\$185.00',
                        style: AppTextStyle.interSemiBold
                            .copyWith(fontSize: 16, color: AppColors.c_090F47),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 11.getH(),
              ),
              Text(
                'Delivery Address',
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.c_090F47, fontSize: 16),
              ),
              SizedBox(
                height: 11.getH(),
              ),
              ...List.generate(
                  list.length,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.getH()),
                        child: ListTile(
                          onTap: (){
                            character=list[index];
                           setState(() {
        
                           });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                  width: 1,
                                  color: AppColors.c_090F47.withOpacity(0.45))),
                          contentPadding: EdgeInsets.only(
                              left: 8.getW(),
                              top: 16.getH(),
                              bottom: 16.getH(),
                              right: 12.getW()),
                          leading: Radio<Address>(
                            value: list[index],
                            groupValue: character,
                            onChanged: (Address? value) {
                              character = value;
                              setState(() {});
                            },
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].address,
                                style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.c_090F47, fontSize: 14),
                              ),
                              Text(
                                '(205) 555-024',
                                style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.c_090F47.withOpacity(0.45),
                                    fontSize: 13),
                              ),
                              Text(
                                list[index].location,
                                style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.c_090F47.withOpacity(0.45),
                                    fontSize: 13),
                              )
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AllIcon.pen),
                          ),
                        ),
                      )),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '+ Add Address',
                      style: AppTextStyle.interRegular
                          .copyWith(color: AppColors.c_4157FF, fontSize: 14),
                    ),
                  )
                ],
              ),
              Text(
                'Payment method',
                style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.c_090F47,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12.getH(),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppColors.c_090F47.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.symmetric(
                    horizontal: 10.getW(), vertical:10.getH()),
                child: Column(
                  children: [
                    ...List.generate(list2.length, (index) =>Padding(
                      padding:EdgeInsets.symmetric(vertical: 4.getH()),
                      child: ListTile(
                        onTap: (){
                          character2=list2[index];
                          setState(() {});
                        },
                        title:Text(list2[index].title),
                        leading:Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 1,color: AppColors.c_090F47.withOpacity(0.1))
                          ),
                          padding:EdgeInsets.symmetric(horizontal: 4.getW(),vertical: 5.getH()),
                          child:Image.asset(list2[index].image,width: 32.getW(),height: 30.getH(),),
                        ),
                        trailing: Radio<PaymentMethod>(
                          value:list2[index],
                          groupValue: character2,
                          onChanged: (PaymentMethod? value){
                            character2=value;
                            setState(() {
                            });
                          },
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 21.getH(),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: AppColors.c_4157FF,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Pay Now \$185.00',
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Address {
  final String address;
  final String location;

  Address({
    required this.address,
    required this.location,
  });
}

class PaymentMethod {
  final String image;
  final String title;

  PaymentMethod({required this.image, required this.title});
}
//list2[index].title