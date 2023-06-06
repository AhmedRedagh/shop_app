import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Shared/network/local/cache_helper.dart';
import 'package:shop_app/screens/on_boarding_screen/on_boarding_cubit/on_boarding_states.dart';

import '../../LoginScreen/login_screen.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(IntialOnBoardingState());
  static final boardingController = PageController();
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  static Widget splashEndButton(context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      padding: const EdgeInsets.only(bottom: 25),
      child: FloatingActionButton(
        onPressed: () => {
          OnBoardingCubit().navigateAndFinish(
            boardingController: boardingController,
            context: context,
          ),
          CacheHelper().setPrefs('boardingFinish', true)
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }

  static Widget itemBuilder(context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/welcome-1.png'),
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.contain),
            ),
          ),
        ),
        const Text(
          'title',
          style: TextStyle(fontSize: 80),
        ),
        const Text('data'),
      ],
    );
  }

  static Widget splashPageView() {
    return PageView.builder(
        controller: boardingController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) =>
            OnBoardingCubit.itemBuilder(context, index));
  }

  void navigateAndFinish({@required boardingController, @required context}) {
    int currentPage = boardingController.page!.toInt();
    if (currentPage != 3) {
      boardingController.nextPage(
          duration: const Duration(microseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      emit(NavigatedSuccess());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SignInPage(),
          ),
          (Route<dynamic> route) => false);
    }
  }
}
