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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffff7900), width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (() {}),
                          icon: Image.asset(
                            "assets/images/photo-stories-promos.png",
                            // width: 85,
                            // fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffff7900), width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (() {}),
                          icon: Image.asset(
                            "assets/images/photo-stories-promos.png",
                            // width: 85,
                            // fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffff7900), width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (() {}),
                          icon: Image.asset(
                            "assets/images/photo-stories-promos.png",
                            // width: 85,
                            // fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffff7900), width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (() {}),
                          icon: Image.asset(
                            "assets/images/photo-stories-promos.png",
                            // width: 85,
                            // fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffff7900), width: 2),
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (() {}),
                          icon: Image.asset(
                            "assets/images/photo-stories-promos.png",
                            // width: 85,
                            // fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                // height: 250,
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/background-02-conso.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.call_sharp,
                            size: 16,
                          ),
                        ),
                        Text(
                          "Crédit global",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "HelveticaNeueLTStd-Bd"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "4500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 34),
                                children: [
                              TextSpan(
                                  text: " FCFA", style: TextStyle(fontSize: 24))
                            ]))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(80, 190, 135, 0.4),
                                        blurRadius: 14,
                                        offset: Offset(5, 5), // Shadow position
                                      ),
                                    ]),
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      "assets/images/dashboard-conso/icons-cartes-credit.png",
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Crédit",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          // width: 55,
                          // height: 55,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(75, 180, 230, 0.4),
                                        blurRadius: 14,
                                        offset: Offset(5, 5), // Shadow position
                                      ),
                                    ]),
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      "assets/images/dashboard-conso/icons-cartes-internet.png",
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Internet",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          // width: 55,
                          // height: 55,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(208, 172, 219, 0.4),
                                        blurRadius: 14,
                                        offset: Offset(5, 5), // Shadow position
                                      ),
                                    ]),
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      "assets/images/dashboard-conso/icons-cartes-illimix.png",
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Illimix",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(255, 180, 0, 0.4),
                                        blurRadius: 14,
                                        offset: Offset(5, 5), // Shadow position
                                      ),
                                    ]),
                                child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () => {},
                                    icon: Image.asset(
                                      "assets/images/dashboard-conso/icons-cartes-illiflex.png",
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Illiflex",
                                style: TextStyle(
                                    fontFamily: "HelveticaNeueLTStd-Bd",
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OrangeSargalDashboardCard(),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Pass favoris",
                    style: TextStyle(
                        fontSize: 16, fontFamily: "HelveticaNeueLTStd-Bd"),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              // ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: ((context, index) {
              //       return SizedBox(height: 50, width: 50, child: Text("data"));
              //     }),
              //     separatorBuilder: ((context, index) {
              //       return SizedBox(
              //         width: 15,
              //       );
              //     }),
              //     itemCount: 4)
            ],
          ),
        ),
      ],
    );
  }
}

class OrangeSargalDashboardCard extends StatelessWidget {
  const OrangeSargalDashboardCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 111,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/dashboard-conso/illustrations-sargal-gift.png"),
              alignment: Alignment.bottomRight),
          gradient: Gradient.lerp(
              LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.8),
                  Color.fromRGBO(255, 255, 255, 0.58),
                ],
              ),
              LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xFFff7900),
                  Color(0xFFffe6d0),
                ],
              ),
              0.6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Flex(
                direction: Axis.vertical,
                children: [
                  Text(
                    "Orange Sargal",
                    style: TextStyle(
                        fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Image(
                          image: AssetImage(
                              "assets/images/dashboard-conso/icons-sargal-star-basic.png")),
                      Flex(
                        mainAxisSize: MainAxisSize.max,
                        direction: Axis.vertical,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // textDirection: TextDirection.ltr,
                        children: [
                          Text(
                            "1,750",
                            style: TextStyle(
                                fontFamily: "HelveticaNeueLTStd-Bd",
                                fontSize: 24),
                          ),
                          Text(
                            "Points",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "HelveticaNeueLTStd-Roman"),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Text(
            "Convertir mes points",
            style: TextStyle(
                color: Color(0xFFff7900),
                fontFamily: "HelveticaNeueLTStd-Bd",
                fontSize: 14,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
