import 'package:brew_crew/Screens/Authenticate/auhtenticate.dart';
import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/Home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<BrewUser?>(context);
    // print(user);
    //return either Home or Authenticate widget
    return user == null ? Authenticate() : Home();
  }
}
