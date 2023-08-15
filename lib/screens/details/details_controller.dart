import 'package:get/get.dart';

import '../../data/models/products_model.dart';

class DetailsController extends GetxController {
  //*this will get product data from the previous screen so we don't have to call the api on this screen
  final AllProducts product = Get.arguments;

//* this boolean will extend the image and show the description and rating bar
  final _isExpanded = false.obs;
  bool get isExpanded => _isExpanded.value;
  set isExpanded(value) => _isExpanded.value = value;
}
