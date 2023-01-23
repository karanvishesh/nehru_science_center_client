import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nehru_science_center_client/Screen/DetailPage/detail_page.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  List<int> data = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/menu.svg',
                        color: Color(0xff2A3E6F),
                        width: 40,
                        semanticsLabel: 'menu'),
                  ),
                  Text(
                    'Welcome Ritika',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff2A3E6F).withOpacity(0.7)),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Nehru Science Center',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2A3E6F)),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff2A3E6F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusColor: Color(0xff2A3E6F),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: Icon(
                      Icons.close,
                      size: 30,
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff2A3E6F)),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff2A3E6F).withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 370,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Cards();
              }),
        ),
      ]),
    )));
  }
}

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(DetailPage());
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 270,
              height: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1572148884483-794c9b6c6963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                width: double.infinity,
                height: 90,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Text(
                          "Nehru Science Center",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff2A3E6F),
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '350 / person',
                            style: TextStyle(
                                color: Color(0xff2A3E6F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 110,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.favorite_border),
                ),
                top: 10,
                right: 20)
          ],
        ));
  }
}
