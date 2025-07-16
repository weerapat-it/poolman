import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../../screens/page/Gmap_page.dart';
class CompleteProfileEditScreen extends StatelessWidget {
  static String routeName = "/complete_profile_edit";
  @override
  Widget build(BuildContext context) {
    final SignUpArgumentsProfile agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(username:agrs.username,password:agrs.password),
    );
  }
}
class SignUpArgumentsProfile {
  final String username;
  final String password;

  SignUpArgumentsProfile({@required this.username,@required this.password});
}
