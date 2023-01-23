import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nehru_science_center_client/Constants/fonts.dart';
import 'package:nehru_science_center_client/Screen/BottomNavBar/bottom_navbar.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class EnterOtp extends StatelessWidget {
  EnterOtp({super.key});
  final _otpkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Form(
          key: _otpkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/back.svg',
                color: Colors.white,
                height: 35,
                width: 35,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 50.w,
                child: Text(
                  'Verify Your Phone..',
                  style: title1.copyWith(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Code is sent to +91 7397830280",
                style: subtitle2.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              BuildPinput(),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't recieve code? ",
                    style: subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Request Again",
                    style: subtitle2.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (_otpkey.currentState!.validate()) {
                    Get.offAll(() => const BottomNavBar(
                          initailIndex: 0,
                        ));
                  }
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: subtitle2.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class BuildPinput extends StatelessWidget {
  const BuildPinput({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        // color: Colors.red,
        border: Border.all(color: Colors.red),
      ),
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.w600,
      ),
    );

    return Pinput(
      length: 5,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter OTP";
        } else if (value.length < 5) {
          return "OTP must be 5 digits";
        } else if (value != '12345') {
          return "Invalid OTP";
        }
        return null;
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
