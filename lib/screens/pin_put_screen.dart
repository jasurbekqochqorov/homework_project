import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homework12/test/test.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/size/size_utils.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import 'package:pinput/pinput.dart';
import 'counter/counter_controller.dart';

class PinPutScreen extends StatefulWidget {
  const PinPutScreen({super.key});

  @override
  State<PinPutScreen> createState() => _PinPutScreenState();
}

class _PinPutScreenState extends State<PinPutScreen> {
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 32,
      height: 32,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 3),
        // borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Colors.blue,width: 3),);

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    width = MediaQuery.of(context).size.width;
    TextEditingController answerController=TextEditingController();
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppImages.image,
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
          Positioned(
            top: 60,left:40,right: 40,
            child:Obx(()=>Column(children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Text("${controller.counter1}-topishmoq",style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.black,fontSize: 34
                ),),
              ),
              const SizedBox(height: 200,),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(test[controller.counter.toInt()],style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black,fontSize: 28
                ),),
                const SizedBox(height: 100,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Pinput(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      length:answer[controller.counter.toInt()].length,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      controller: answerController,
                      validator: (s) {
                        if(s == answer[controller.counter.toInt()]){
                          answerController.text='';
                          if(controller.counter.toInt()==test.length-1){
                             showDialog(context: context, builder:(context){
                               return const AlertDialog(
                                 content: Text('Thank you '),
                               );
                             });
                          }
                          else{
                            return controller.increment();
                          }
                        }
                        else{
                          answerController.text='';
                          return 'answer is incorrect';
                        }
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                  ),
                ),
                const SizedBox(height:20,),
                SizedBox(
                  height: 150,
                  child: GridView.count(crossAxisCount: 6,
                  children: List.generate(answer[controller.counter.toInt()].length*2, (index){
                    List<String> list=['x','b','c','d','e','f','g'];
                    String l=(index.isOdd)?list[Random().nextInt(6)]:answer[controller.counter.toInt()][index~/2];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal:4,vertical: 4),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:Colors.blue
                        ),
                        child: Text(l,style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.white,fontSize:16
                        ),),
                        onPressed: (){
                          answerController.text+=l;
                      },
                      ),
                    );
                  }),),
                ),
                TextButton(onPressed: (){
                  answerController.text=answerController.text.substring(0,answerController.text.length-1);
                }, child:const Icon(Icons.dangerous,size: 40,))
              ]),
            ],)),
          )
        ],
      ),
    );
  }
}
