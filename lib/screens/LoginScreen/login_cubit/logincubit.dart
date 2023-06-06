import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/Shared/network/remote/dio_helper.dart';
import 'package:shop_app/Shared/network/remote/end_points.dart';
import 'package:shop_app/screens/LoginScreen/login_cubit/login_cubit_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(ShopLoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool passwordObscured = true;
  String? password;
  IconData isVisbileIcon = Icons.visibility;

  void visibletoggle() {
    passwordObscured = !passwordObscured;
    isVisbileIcon = passwordObscured ? Icons.visibility_off : Icons.visibility;
    emit(VisiblityToggleState());
    debugPrint('hi from state');
  }

  Future<void> userLogin({@required email, @required password}) async {
    LoginModel model;
    emit(SignInLoadingState());
    var json = {
      "email": "$email",
      "password": "$password",
    };

    await DioHelper.postData(url: lOGIN, data: json)
        .then((value) => {
              model = LoginModel.fromJson(value.data),
              emit(SignInSuccessState(model)),
              debugPrint(model.status.toString()),
              CacheHelper().setToken('token', model.data?.token)
            })
        .onError((error, stackTrace) => {
              emit(SignInErrorState()),
              debugPrint(error.toString()),
            });
  }

  void navigateAndFinish({@required route, @required context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route()));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => route,
        ),
        (Route<dynamic> route) => false);
  }
}
