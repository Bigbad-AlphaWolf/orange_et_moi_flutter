import 'package:flutter/material.dart';

class ConsoBoard extends StatefulWidget {
  const ConsoBoard({super.key});

  @override
  State<ConsoBoard> createState() => _ConsoBoardState();
}

class _ConsoBoardState extends State<ConsoBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff7900), width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/photo-stories-promos.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff7900), width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/photo-stories-promos.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff7900), width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/photo-stories-promos.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff7900), width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/photo-stories-promos.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff7900), width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/photo-stories-promos.png"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
