import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/ShopScreen/ShopCubit/shop_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit.get(context).getHomeData();
    var cubit = ShopCubit.get(context);
    var model = cubit.homeModel!.data;
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
              items: List.generate(
                  3,
                  (index) => Image.network(
                        model!.banners[index].image,
                      )),
              options: CarouselOptions(
                  animateToClosest: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1.0)),
          ConstrainedBox(
            constraints: const BoxConstraints(),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.34,
              children: List.generate(
                model!.products.length,
                (index) => Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        model.products[index].image,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        model.products[index].name,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
