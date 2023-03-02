import 'package:flutter/material.dart';

class ListDetailsTransaction extends StatelessWidget {
  const ListDetailsTransaction({
    Key? key,
    required this.listTransactions,
  }) : super(key: key);

  final List<Map<String, dynamic>> listTransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xffdddddd))),
      margin: EdgeInsets.only(top: 14.5),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Icon(Icons.shopping_bag),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listTransactions.elementAt(index)["labelTrx"] ?? "",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "HelveticaNeueLTStd-Roman"),
                          ),
                          Text(
                            listTransactions
                                    .elementAt(index)["fullNameRecipient"] ??
                                "",
                            style: TextStyle(
                                fontFamily: "HelveticaNeueLTStd-Roman",
                                fontSize: 12,
                                color: Color(0xff999999)),
                          ),
                          Text(
                            listTransactions.elementAt(index)["dateTrx"],
                            style: TextStyle(
                                fontFamily: "HelveticaNeueLTStd-Roman",
                                fontSize: 12,
                                color: Color(0xff999999)),
                          )
                        ],
                      ),
                      Text(
                        listTransactions.elementAt(index)["amount"],
                        style: TextStyle(color: Color(0xff32c832)),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider(color: Color(0xffdddddd));
          }),
          itemCount: listTransactions.length),
    );
  }
}
