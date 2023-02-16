import 'dart:ui';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
          bottom: 20,
          left: 15,
          right: 15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffe3e3e8), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                width: 40,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/icons-profil-profil.png"),
              ),
              GestureDetector(
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "78 121 09 42",
                      style: TextStyle(
                          fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (() {}),
                  icon: Icon(size: 30, Icons.notifications_none_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(size: 30, Icons.settings_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(size: 30, Icons.qr_code_scanner))
            ],
          )
        ],
      ),
    );
  }
}
