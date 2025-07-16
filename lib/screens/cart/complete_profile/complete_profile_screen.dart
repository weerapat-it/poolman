import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../../screens/page/Gmap_page.dart';
class CompleteProfileCartScreen extends StatelessWidget {
  static String routeName = "/complete_profile_cart";
  @override
  Widget build(BuildContext context) {
    final SignUpArgumentsCart agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(username:agrs.username,password:agrs.password),
    );
  }
}
class SignUpArgumentsCart {
  final String username;
  final String password;

  SignUpArgumentsCart({@required this.username,@required this.password});
}
