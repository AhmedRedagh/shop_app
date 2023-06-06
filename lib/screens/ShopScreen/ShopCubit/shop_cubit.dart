import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/Shared/network/remote/dio_helper.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/screens/ShopScreen/ShopCubit/shop_cubit_states.dart';
import 'package:shop_app/screens/ShopScreen/favorites_screen/favorites_screen.dart';
import 'package:shop_app/screens/ShopScreen/products_screen/products_screen.dart';

import '../categories_screen/categories_screen.dart';
import '../settings_screen/settings_screen.dart';

class ShopCubit extends Cubit<ShopCubitStates> {
  ShopCubit() : super(ShopCubitIntialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int navIndex = 0;
  HomeModel? homeModel;
  var bottomScreens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavScreen(),
    SettingsScreen(),
  ];

  var bottomNavBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.redAccent), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category, color: Colors.green), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite, color: Colors.blue), label: 'Favorites'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          color: Color.fromARGB(255, 25, 19, 0),
        ),
        label: 'Settings'),
  ];

  void bottomNavSelection(index, context) {
    navIndex = index;

    emit(BottomNavChangeState());
  }

  getHomeData() async {
    emit(GetHomeDataLoadingState());

    DioHelper.getData(url: 'home', token: await CacheHelper().getToken('token'))
        .then((value) => {
              emit(GetHomeDataSuccessState()),
              homeModel = HomeModel.fromJson(
                value.data,
              ),
              debugPrint('${homeModel!.data?.products[0].description}'),
            })
        .onError((error, stackTrace) =>
            {debugPrint(error.toString()), emit(GetHomeDataErrorState())});
  }
}
