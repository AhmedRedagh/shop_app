import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customtextField(
    {visibleTapFunction,
    @required controller,
    required bool isObsecured,
    prefixIcon,
    suffixIcon}) {
  return TextFormField(
    controller: controller,
    obscureText: isObsecured,
    decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
            icon: Icon(suffixIcon), onPressed: () => visibleTapFunction())),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'please enter your data correctly';
      }
      return null;
    },
  );
}

toastNotfication({@required msg, color}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: color,
    timeInSecForIosWeb: 5,
    gravity: ToastGravity.BOTTOM,
  );
}

navigateTo(context, route) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ));
}
