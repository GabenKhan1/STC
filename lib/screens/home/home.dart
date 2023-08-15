import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stc_flutter/core/style.dart';
import 'package:stc_flutter/screens/home/home_controller.dart';
import 'package:stc_flutter/screens/home/widgets/product_card.dart';

import '../../core/colors.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? skeleton(size)
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Center(
                          child: Text(
                            "All Products",
                            style: headingStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.allProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = controller.allProducts[index];
                          return ProductCard(
                              size: size,
                              onTap: () => Get.toNamed(Routes.detailsScreen,
                                  arguments: product),
                              title: product.title.toString(),
                              description: product.description.toString(),
                              image: product.image.toString(),
                              price: product.price.toString(),
                              rating: product.rating!.rate!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget skeleton(Size size) {
    return Skeletonizer(
      enabled: controller.isLoading,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.16,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          " AED",
                          style: headingStyle.copyWith(color: white),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Title of the",
                    maxLines: 2,
                    style: titleStyle.copyWith(
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "description of the products",
                    maxLines: 2,
                    style: bodyStyle.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Divider(
                    color: textFieldColor,
                    height: 16,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
