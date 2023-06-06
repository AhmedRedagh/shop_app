import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/screens/IntialPageCheck/intial_page_check.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/LoginScreen/login_cubit/logincubit.dart';
import 'package:shop_app/screens/ShopScreen/ShopCubit/shop_cubit.dart';
import 'package:shop_app/screens/on_boarding_screen/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:shop_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'Shared/Observer/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool boardingFinish = await CacheHelper().getPrefs('boardingFinish') ?? false;
  bool isLogged = await CacheHelper().getPrefs('isLogged') ?? false;

  Widget initialPage =
      startPage(boardingFinish: boardingFinish, isLogged: isLogged);
  runApp(MyApp(
    initialPage: initialPage,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? initialPage;
  const MyApp({super.key, this.initialPage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ShopCubit>(
          create: (context) => ShopCubit(),
        ),
      ],
      child: const MaterialApp(home: OnBoardingScreen()),
    );
  }
}
