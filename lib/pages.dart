import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewPage(
                    navigatedFrom: 'Home Screen',
                  )));
        },
        child: Text('Open Secondary Page'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final Function openSettings;
  const SettingsScreen({Key key, this.openSettings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text("Push other Settings"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewPage(
                navigatedFrom: 'Settings screen',
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String navigatedFrom;

  const NewPage({Key key, @required this.navigatedFrom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Screen navigated from $navigatedFrom',
        ),
      ),
      body: Container(
        child: FlatButton(
          child: Text("Push new Screen"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewPage(
                  navigatedFrom: 'New Page',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
