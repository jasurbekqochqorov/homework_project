import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/country_model.dart';
import 'package:flutter_nt_ten/data/models/user_model.dart';
import 'package:flutter_nt_ten/view_model/country_view_model.dart';
import 'package:flutter_nt_ten/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: context.watch<UserViewModel>().isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView(
        children: [
          ...List.generate(
              context.watch<UserViewModel>().users.length,
                  (index) {
                UserModel user =
                context.watch<UserViewModel>().users[index];

                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.username),
                  leading: Image.network(user.avatarUrl,
                  height: 50,
                  width: 50,),
                  trailing: Text(user.state),
                );
              })
        ],
      ),
    );
  }
}
