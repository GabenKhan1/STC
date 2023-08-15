import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/colors.dart';
import '../../../core/style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.size,
      required this.onTap,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.rating});
  final String title;
  final String description;
  final String image;
  final String price;
  final double rating;
  final Size size;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: black),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$price AED",
                    style: headingStyle.copyWith(color: white),
                  ),
                  RatingBarIndicator(
                    unratedColor: Colors.grey.shade300,
                    direction: Axis.horizontal,
                    rating: rating,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: starColor,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              title,
              maxLines: 1,
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w100, fontStyle: FontStyle.italic),
            ),
            Text(
              description,
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
  }
}
