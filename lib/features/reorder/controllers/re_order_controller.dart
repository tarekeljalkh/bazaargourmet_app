import 'package:bazaargourmet_ecommerce/data/model/api_response.dart';
import 'package:bazaargourmet_ecommerce/features/reorder/domain/services/re_order_service_interface.dart';
import 'package:bazaargourmet_ecommerce/main.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bazaargourmet_ecommerce/common/basewidget/show_custom_snakbar_widget.dart';
import 'package:bazaargourmet_ecommerce/features/cart/screens/cart_screen.dart';


class ReOrderController with ChangeNotifier {
  final ReOrderServiceInterface reOrderServiceInterface;
  ReOrderController({required this.reOrderServiceInterface});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<ApiResponse> reorder({String? orderId}) async {
    _isLoading =true;
    ApiResponse apiResponse = await reOrderServiceInterface.reorder(orderId!);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      showCustomSnackBar(apiResponse.response?.data['message'], Get.context!, isError: false);
      Navigator.push(Get.context!, MaterialPageRoute(builder: (_) => const CartScreen()));
    }
    notifyListeners();
    return apiResponse;
  }

}
