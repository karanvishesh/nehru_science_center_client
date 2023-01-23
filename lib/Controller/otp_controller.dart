
import 'package:get/get.dart';
import 'package:nehru_science_center_client/Auth/auth_repository.dart';
import 'package:nehru_science_center_client/Screen/BottomNavBar/bottom_navbar.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOtp(String otp) async {
    var isVerified = await AuthRepository.instance.verifyOtp(otp);
    isVerified
        ? Get.offAll(const BottomNavBar(
            initailIndex: 0,
          ))
        : Get.back();
  }
}