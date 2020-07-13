import 'package:flutter/material.dart';
import 'package:wolfpack/services/auth.dart';

final AuthService _auth = AuthService();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepOrange[600],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
    );
  }
}
