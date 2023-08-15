import 'package:get/get.dart';
import 'package:stc_flutter/data/models/products_model.dart';

import '../../data/providers/user_provider.dart';

class HomeController extends GetxController {
  //*instance of userProvider
  final UserProvider _userProvider = UserProvider();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  List<AllProducts> allProducts = <AllProducts>[].obs;

  getProducts() async {
    _isLoading.value = true;
    final products = await _userProvider.getProducts();
    for (final product in products) {
      allProducts.add(AllProducts.fromJson(product));
    }
    _isLoading.value = false;
  }
}
