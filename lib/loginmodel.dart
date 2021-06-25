
import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/auth.dart';
import 'locator.dart';
enum ViewState{
  Idle, Busy
}
class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage="";

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;


  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);

    if (userId == null) {
      errorMessage = 'Value entered is not a number.';
      setState(ViewState.Idle);
      return false;
    } else if (userId <= 0 || userId > 10) {
      errorMessage = 'Number must between 1- 10.';
      setState(ViewState.Idle);
      return false;
    }
    var success =  await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}

