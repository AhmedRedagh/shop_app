import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'on_boarding_cubit/on_boarding_cubit.dart';
import 'on_boarding_cubit/on_boarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      builder: (context, state) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30),
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OnBoardingCubit.splashPageView(),
              ),
              SmoothPageIndicator(
                controller: OnBoardingCubit.boardingController,
                count: 4,
                axisDirection: Axis.horizontal,
                effect: const ScrollingDotsEffect(
                    dotHeight: 5,
                    activeDotColor: Colors.red,
                    paintStyle: PaintingStyle.fill),
              ),

              //SplashFloatingActionButton
              OnBoardingCubit.splashEndButton(context)
            ],
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
