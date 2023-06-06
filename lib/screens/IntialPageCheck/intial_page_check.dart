import 'package:flutter/material.dart';
import 'package:shop_app/screens/LoginScreen/login_screen.dart';
import 'package:shop_app/screens/ShopScreen/shopmainscreen/shop_screen.dart';
import 'package:shop_app/screens/on_boarding_screen/on_boarding_screen.dart';

// class InitialPage {
//   final bool? boardingFinish;
//   final bool? isLogged;
// InitialPage({this.boardingFinish, this.isLogged});
Widget startPage({boardingFinish, isLogged}) {
  if (boardingFinish == true && isLogged == false) {
    return SignInPage();
  } else if (boardingFinish == true && isLogged == true) {
    return const ShopScreen();
  }

  return const OnBoardingScreen();
}
