


import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier{

  String k='';
  double a=0;
  double b=0;
  String result='';
  String op='';
  number(String number)async{
    k=k+number;
    notifyListeners();
  }

  remove(int remover)async{
    if(remover==0){
      k='';
      result='';
      notifyListeners();
    }
    else if(remover==2){
      k=k.substring(0,k.length-1);
      notifyListeners();
    }
    else{
      k='$k%';
      op='%';
      notifyListeners();
    }
  }
  operation(String operation)async{
    if(operation=='/'){
      if(result.isNotEmpty){
        k=result;
      }
      k=k+operation;
      op=operation;
      notifyListeners();
    }
    else if(operation=='x'){
      if(result.isNotEmpty){
        k=result;
      }
      k=k+operation;
      op=operation;
      notifyListeners();
    }
    else if(operation=='-'){
      if(result.isNotEmpty){
        k=result;
      }
      op=operation;
      k=k+operation;
      notifyListeners();
    }
    else if(operation=='+'){
      if(result.isNotEmpty){
        k=result;
      }
      op=operation;
      k=k+operation;
      notifyListeners();
    }
    else{
      List<String> l=k.split(op);
      a=double.parse(l[0]);
      b=double.parse(l[1]);
      if(op=='/'){
        result=(a/b).toStringAsFixed(1);
      }
      else if(op=='+'){
        result=(a+b).toInt().toString();
      }
      else if(op=='-'){
        result=(a-b).toInt().toString();
      }
      else if(op=='x'){
        result=(a*b).toInt().toString();
      }
      else{
        result='${(a%b).toInt()}';
      }
      notifyListeners();
    }
  }
}