import 'package:flutter/material.dart';

class IbouSection extends StatelessWidget {
  const IbouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      // height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.bottomRight,
              fit: BoxFit.contain,
              image: AssetImage("assets/images/illustrations-ibou-assie.png")),
          color: Color(0xffd9c2f0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 20,
                offset: Offset(5, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Vous avez \n besoin d’aide ?",
            style: TextStyle(fontSize: 24, fontFamily: "HelveticaNeueLTStd-Bd"),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint('ElevatedButton Clicked');
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Tchatter avec Ibou",
                style: TextStyle(
                    height: 1,
                    color: Colors.black,
                    fontFamily: "HelveticaNeueLTStd-Bd",
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
