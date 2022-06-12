import 'package:brew_crew/Screens/Home/brew_list.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: '0').brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew - Home'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
