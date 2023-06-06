import 'package:shop_app/models/login_model.dart';

abstract class LoginStates {}

class ShopLoginIntialState extends LoginStates {}

class SignInSuccessState extends LoginStates {
  final LoginModel loginModel;

  SignInSuccessState(this.loginModel);
}

class SignInLoadingState extends LoginStates {}

class SignInErrorState extends LoginStates {}

class VisiblityToggleState extends LoginStates {}
