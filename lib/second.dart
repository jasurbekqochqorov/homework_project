import 'package:flutter/material.dart';
import 'package:homework12/third.dart';



class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1,color:Colors.black.withOpacity(0.2))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1,color:Colors.black.withOpacity(0.2))
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color:Colors.black.withOpacity(0.2))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color:Colors.black.withOpacity(0.2))
                    )
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(onPressed:(){
                if(nameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Third();
                  }));
                }
              }, child:const Text('Log in'))
            ],
          ),
        ),
    );
  }
}
