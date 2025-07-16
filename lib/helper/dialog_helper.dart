
<<<<<<< HEAD
import 'package:JDPoolsApplication/dialogs/exit_confirmation_dialog.dart';
=======
import 'package:custom_dialog/dialogs/exit_confirmation_dialog.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:flutter/material.dart';

class DialogHelper {

  static exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog());
}