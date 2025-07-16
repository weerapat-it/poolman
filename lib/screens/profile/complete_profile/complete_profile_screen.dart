import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../screens/page/Gmap_page.dart';
class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    final SignUpArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(username:agrs.username,password:agrs.password),
    );
  }
}
class SignUpArguments {
  final String username;
  final String password;

  SignUpArguments({@required this.username,@required this.password});
}
