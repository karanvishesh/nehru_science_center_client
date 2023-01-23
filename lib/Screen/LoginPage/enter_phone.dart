import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nehru_science_center_client/Screen/loginPage/enter_otp.dart';
import 'package:get/get.dart';
import 'package:nehru_science_center_client/Constants/fonts.dart';
import 'package:sizer/sizer.dart';

class EnterPhone extends StatelessWidget {
  EnterPhone({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            key: _key,
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
                    'What\'s your phone number?',
                    style: title1.copyWith(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'We protect our community by making sure that everyone is real. We will never share your phone number with anyone else.',
                    style: subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                PhoneInputField(),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          Get.to(() => EnterOtp());
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone number';
        } else if (value.length != 10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter Your Number',
        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        errorStyle: subtitle2.copyWith(
          color: Colors.red[300],
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
    );
  }
}