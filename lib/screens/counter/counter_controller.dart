import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  RxInt counter1 = 1.obs;

  increment(){
   counter++;
   counter1++;
  }

  decrement() => counter--;
}
