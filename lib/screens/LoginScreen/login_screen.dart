import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/LoginScreen/login_cubit/login_cubit_states.dart';
import 'package:shop_app/screens/LoginScreen/login_cubit/logincubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/screens/ShopScreen/shopmainscreen/shop_screen.dart';
import '../../Custom Widgets/custom_widgets.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final bool isChecked = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  get icon => null;
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.indigo.shade200],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 7,
                ),

                //EmailTextField
                customtextField(
                    controller: emailController,
                    prefixIcon: Icons.email,
                    isObsecured: false),

                const SizedBox(
                  height: 15,
                ),
                //PassWord TextField
                const Text('Password'),
                customtextField(
                    controller: passController,
                    prefixIcon: Icons.lock,
                    suffixIcon: LoginCubit.get(context).isVisbileIcon,
                    isObsecured: LoginCubit.get(context).passwordObscured,
                    visibleTapFunction: () =>
                        LoginCubit.get(context).visibletoggle()),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerRight),
                    onPressed: () {},
                    child: const Text(
                      'Forget your Password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ConditionalBuilder(
                    builder: (context) => ElevatedButton(
                        onPressed: () => LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passController.text),
                        child: const Text(
                          ' Sign In ',
                        )),
                    condition: state is! SignInLoadingState,
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) => {
        if (state is SignInSuccessState)
          {
            if (state.loginModel.status == true)
              {
                toastNotfication(
                  msg: state.loginModel.message,
                  color: Colors.green,
                ),
                LoginCubit.get(context).navigateAndFinish(
                    route: const ShopScreen(), context: context),
                CacheHelper().setPrefs('isLogged', true)
              }
            else
              toastNotfication(
                msg: state.loginModel.message,
                color: Colors.red,
              )
          }
      },
    );
  }
}
