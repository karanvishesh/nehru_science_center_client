import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nehru_science_center_client/Controller/count_controller.dart';

class ChildrenItemCounter extends StatefulWidget {
  @override
  _ChildrenItemCounterState createState() => _ChildrenItemCounterState();
}

class _ChildrenItemCounterState extends State<ChildrenItemCounter> {

  final countState = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (countState.child_count > 0) {
                countState.decrementChild();
            }
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Obx(()=>
            Text(
              // if our item is less  then 10 then  it shows 01 02 like that
             countState.child_count.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
      
                  countState.incrementChild();
          
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: TextButton(
        // padding: EdgeInsets.zero,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(13),
        // ),
        onPressed: () {
          press();
        },
        child: Icon(icon),
      ),
    );
  }
}