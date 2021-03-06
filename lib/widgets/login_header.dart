import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/shared/text_styles.dart';
import 'package:flutter_provider_architecture/shared/ui_helpers.dart';
class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;
  LoginHeader({required this.controller, required this.validationMessage});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Text('Sign In', style: headerStyle),
        UIHelper.verticalSpaceMedium(),
        Text('Enter a number between 1 - 10', style: subHeaderStyle),
      UIHelper.verticalSpaceMedium(),
      LoginTextField(controller),
      this.validationMessage != null? Text(validationMessage, style: TextStyle(color:Colors.red),):Container(),
      UIHelper.verticalSpaceMedium(),
    ]
    );
  }
}
class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  LoginTextField(this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'User Id', ),
          controller: controller),
    );
  }
}
