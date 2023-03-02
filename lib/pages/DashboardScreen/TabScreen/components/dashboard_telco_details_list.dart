import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/user_telco_conso.dart';
import 'package:orange_et_moi/utils/pipes.dart';

class UserTelcoDetails extends StatelessWidget {
  const UserTelcoDetails({
    required this.category,
    required this.listConso,
    Key? key,
  }) : super(key: key);

  final String category;
  final List<TelcoConsoModel> listConso;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffdddddd), width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Icon(
                        Icons.call_sharp,
                        size: 18,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        getConsoTitle(category),
                        style: TextStyle(
                            fontSize: 16, fontFamily: "HelveticaNeueLTStd-Bd"),
                      )
                    ],
                  ),
                  Text(
                    getConsoRedirectionText(category),
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Color(0xffff7900),
                        fontFamily: "HelveticaNeueLTStd-Bd"),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Color(0xffdddddd)))),
                margin: EdgeInsets.only(top: 14.5),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 14.5, bottom: 20),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                listConso.elementAt(index).name,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "HelveticaNeueLTStd-Roman"),
                              ),
                              Text(
                                "Expire ${listConso.elementAt(index).dateExpiration}",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Roman",
                                    fontSize: 12,
                                    color: Color(0xff999999)),
                              )
                            ],
                          ),
                          Text(listConso.elementAt(index).montantRestant,
                              style: TextStyle(
                                  fontFamily: "HelveticaNeueLTStd-Roman"))
                        ],
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return Divider(color: Color(0xffdddddd));
                    }),
                    itemCount: listConso.length),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
