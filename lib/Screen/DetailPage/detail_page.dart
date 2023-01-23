import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: 'image',
              child: Container(
                height: 55.h,
                width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1572148884483-794c9b6c6963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  radius: 20,
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black.withOpacity(0.7),
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: CircleAvatar(
                radius: 20,
                child: Center(
                  child: Icon(
                    CupertinoIcons.share_up,
                    color: Colors.black.withOpacity(0.7),
                    size: 20,
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              minHeight: 50.h,
              maxHeight: 100.h,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              panel: BottomContainer(),
            ),
            //book now button
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                decoration: BoxDecoration(
                  color: Color(0xff2A3E6F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 60.w),
                      child: Text(
                        "Nehru Science Center",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff2A3E6F),
                          size: 15,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Mumbai, India",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Rs 100",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff2A3E6F)),
                    ),
                    Text(
                      "/ person",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("About",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Nehru Science Centre, among the four National level Science Museums in NCSM, working as the Western Zone Headquarters with four science centres in Nagpur, Bhopal, Dharampur and Goa under its umbrella caters to the people in the Western part of India. As a part of its activities, the Centre organizes regular extensive science education programmes, activities and competitions for the benefit of the common people.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            
          ],
        ));
  }
}
