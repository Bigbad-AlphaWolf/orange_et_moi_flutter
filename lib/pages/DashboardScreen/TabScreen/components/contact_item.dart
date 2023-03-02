import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    Key? key,
    required this.elt,
  }) : super(key: key);

  final Map<String, String?> elt;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xff666666),
          child: elt["avatar"] == null
              ? Text(
                  elt["initial"]!,
                  style: TextStyle(color: Color(0xffdddddd)),
                )
              : Image(
                  image: AssetImage("assets/images/photo-stories-promos.png")),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          elt["fullName"] ?? "",
          textAlign: TextAlign.center,
          softWrap: false,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(fontFamily: "HelveticaNeueLTStd-Roman", fontSize: 12),
        )
      ],
    );
  }
}
