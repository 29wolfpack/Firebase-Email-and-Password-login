import 'package:flutter/material.dart';
import 'package:wolfpack/screens/authenticate/register.dart';
import 'package:wolfpack/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //field states
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[600],
          elevation: 0.0,
          title: Text('Sign In'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Register'))
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? 'Enter an Email' : null;
                    },
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      return val.length < 6
                          ? 'Enter a pwd with atleast 6 char'
                          : null;
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      color: Colors.deepOrange,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .signinWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please type valid email';
                            });
                          }
                        }
                      }),
                  SizedBox(width: 20),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                ],
              ))),
    );
  }
}
