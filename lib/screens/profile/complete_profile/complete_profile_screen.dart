import 'package:flutter/material.dart';

import 'components/body.dart';

<<<<<<< HEAD
import '../../../screens/page/Gmap_page.dart';
class CompleteProfileEditScreen extends StatelessWidget {
  static String routeName = "/complete_profile_edit";
  @override
  Widget build(BuildContext context) {
    final SignUpArgumentsProfile agrs =
=======
import '../../screens/page/Gmap_page.dart';
class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    final SignUpArguments agrs =
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(username:agrs.username,password:agrs.password),
    );
  }
}
<<<<<<< HEAD
class SignUpArgumentsProfile {
  final String username;
  final String password;

  SignUpArgumentsProfile({@required this.username,@required this.password});
=======
class SignUpArguments {
  final String username;
  final String password;

  SignUpArguments({@required this.username,@required this.password});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
}
