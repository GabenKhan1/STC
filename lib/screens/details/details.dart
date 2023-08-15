import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stc_flutter/screens/details/details_controller.dart';
import '../../core/colors.dart';
import '../../core/style.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(
                      () => Container(
                        width: size.width,
                        height: controller.isExpanded
                            ? size.height * 0.46
                            : size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.product.image.toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: white,
                                shape: BoxShape.rectangle),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: white,
                                shape: BoxShape.rectangle),
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                size: 24,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 2,
                      left: 10,
                      child: Text(
                        "${controller.product.price.toString()} AED",
                        style: headingStyle.copyWith(
                            fontSize: 32, color: textColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Obx(
                            () => IconButton(
                              onPressed: () {
                                controller.isExpanded = !controller.isExpanded;
                              },
                              icon: Icon(controller.isExpanded
                                  ? Icons.arrow_downward_rounded
                                  : Icons.arrow_upward_rounded),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.upload_outlined,
                                  color: primary,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70.h,
                              width: MediaQuery.sizeOf(context).width * 0.74,
                              child: FilledButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(primary)),
                                onPressed: () {},
                                child: const Text(
                                  "Order Now",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          controller.product.title.toString(),
                          style: titleStyle.copyWith(
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          controller.product.description.toString(),
                          style: bodyStyle.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.isExpanded,
                            child: Container(
                              height: 100.h,
                              width: size.width,
                              color: Colors.grey.withOpacity(0.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Reviews (${controller.product.rating?.count.toString()})",
                                      style: bodylargeStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Text(
                                        controller.product.rating!.rate
                                            .toString(),
                                        style: titleStyle,
                                      ),
                                      const SizedBox(width: 20),
                                      RatingBarIndicator(
                                        unratedColor: Colors.grey.shade400,
                                        direction: Axis.horizontal,
                                        rating:
                                            controller.product.rating!.rate!,
                                        itemCount: 5,
                                        itemSize: 30,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: starColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
