import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/ShopScreen/ShopCubit/shop_cubit.dart';
import 'package:shop_app/screens/ShopScreen/ShopCubit/shop_cubit_states.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopCubitStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('shop screen')),
        body: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: cubit.bottomScreens[cubit.navIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: ShopCubit.get(context).bottomNavBarItems,
          currentIndex: cubit.navIndex,
          onTap: (value) => cubit.bottomNavSelection(value, context),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
