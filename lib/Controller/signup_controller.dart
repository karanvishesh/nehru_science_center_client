import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nehru_science_center_client/Auth/auth_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final phone = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}