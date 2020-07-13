import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolfpack/screens/authenticate/authenticate.dart';
import 'package:wolfpack/models/user.dart';
import 'package:wolfpack/screens/home/home.dart';
// import 'package:wolfpack/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
