// important notes:
//   - for every file we want to use that is external to the project we need to
//     go to pubspec.yaml and change the configuration to fit our external
//     files/directories.

//   - elevated Button example:
//        ElevatedButton.icon(
//        onPressed: () {
//        print('hello');
//        },
//        label: const Text('click me'),
//        icon: const Icon(Icons.mail),
//        style: ButtonStyle(
//        backgroundColor: MaterialStateProperty.all(Colors.red),
//        overlayColor: MaterialStateProperty.all(Colors.white54)),
//        ),

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      //The Scaffold is like a wrapper to a few different layout widgets
      home: NinjaCard()));
}

// write "stless" and then Tab
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.alternate_email),
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[500],
      ),
    );
  }
}

//Stateless Widget: the state of the widget cannot change over time
//Stateful Widgets: the state of the widget can change over time

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //whenever we want to change the state of a data we need to use the setState!
          setState(() {
            ninjaLevel++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.tvguide.com/a/img/resize/a51d3827485227d265a6b2f27cc2b3863bc252c1/hub/2021/03/10/ab5a34bc-1826-4fd0-afca-a78af88ac10f/2-avatar-the-last-airbender-hr-copy-2.jpg?auto=webp&fit=crop&height=1080&width=1920'),
                radius: 40,
              ),
            ),
            Divider(
              thickness: 1,
              height: 90.0,
              color: Colors.grey[800],
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Chun-Li',
              style: TextStyle(
                  color: Colors.amberAccent[400],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                  color: Colors.amberAccent[400],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: const <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.0),
                Text(
                  'blabla@gmail.com',
                  style: TextStyle(color: Colors.grey, letterSpacing: 0.8),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
