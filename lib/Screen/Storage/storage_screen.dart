import 'package:flutter/material.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {

  void isLogin() async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();

  }

  @override
  void initState() {
    isLogin();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email'),
            SizedBox(height: 5.getH(),),
            TextField(
              decoration: InputDecoration(
                focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(width: 1,color: AppColors.blue)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1,color: AppColors.blue)
                ),
                hintText: 'email'
              ),
            ),
            SizedBox(height: 5.getH(),),
            Text("Password"),
            SizedBox(height: 5.getH(),),
            TextField(
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1,color: AppColors.blue)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1,color: AppColors.blue)
                  ),hintText: 'Password'
              ),
            ),
            SizedBox(height: 20.getH(),),
            Center(child: TextButton(onPressed:(){}, child:Text('Validate')))
          ],
        ),
      ),
    );
  }
}
