import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName = null;
  String? _currentSugars = null;
  int? _currentStrength = null;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<BrewUser?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                    val!.isEmpty ? 'please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  //  drop down
                  DropdownButtonFormField(
                      value: _currentSugars ?? userData.sugars,
                      decoration: textInputDecoration,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() => _currentSugars = val as String?);
                      }),
                  SizedBox(height: 20.0),
                  //  slider
                  Slider(
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      value: (_currentStrength ?? userData.strength).toDouble(),
                      activeColor: Colors.brown[_currentStrength ?? userData.strength],
                      inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                      onChanged: (val) {
                        setState(() => _currentStrength = val.round());
                      }),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(_currentName);
                      print(_currentSugars);
                      print(_currentStrength);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
