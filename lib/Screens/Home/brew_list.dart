import 'package:brew_crew/Screens/Home/brew_tile.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  DatabaseService dbService = DatabaseService(uid: '0');

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    if (brews != null) {
      // brews.forEach((brew) {
      //   print('${brew.name}');
      //   print('${brew.sugars}');
      //   print('${brew.strength}');
      // });
      return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(brew: brews[index]);
        },
      );
    }
    else{
      return Container();
    }
  }
}
