import 'package:brew_crew/Screens/Authenticate/auhtenticate.dart';
import 'package:flutter/material.dart';
import 'Home/Home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    //return either Home or Authenticate widget
    return Authenticate();
  }
}
