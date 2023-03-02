import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/qr_code_response.dart';
import 'package:orange_et_moi/services/orange-money/orange_money.service.dart';
import 'package:skeletons/skeletons.dart';

class QRCodeForDashboard extends StatefulWidget {
  const QRCodeForDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<QRCodeForDashboard> createState() => _QRCodeForDashboardState();
}

class _QRCodeForDashboardState extends State<QRCodeForDashboard> {
  OrangeMoneyService omService = OrangeMoneyService();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2 - 22.5,
            height: MediaQuery.of(context).size.width / 2 - 22.5,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xffdddddd),
                  width: 1,
                )),
            child: FutureBuilder(
                future: getOmQRImage(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.rectangle,
                        width: MediaQuery.of(context).size.width / 2 - 22.5,
                        height: MediaQuery.of(context).size.width / 2 - 22.5,
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var b64 = snapshot.data!.qrCode;

                      return Image.memory(base64Decode(b64));
                      // return Image(
                      //     fit: BoxFit.cover,
                      //     image:
                      //         AssetImage("assets/images/dashboard-om/qr.png"));
                    }
                  }
                  return Text("hasError");
                }))),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 22.5,
          height: MediaQuery.of(context).size.width / 2 - 22.5,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xffdddddd),
                width: 1,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Scanner et payer",
                  style: TextStyle(
                      fontFamily: "HelveticaNeueLTStd-Bd", fontSize: 14),
                ),
                Text(
                  "Effectuer vos achats en toute sécurité en payant par le Scan QR.",
                  style: TextStyle(
                      fontFamily: "HelveticaNeueLTStd-Roman",
                      color: Color(0xff666666),
                      fontSize: 12),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton Clicked');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xffff7900)),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Row(
                      children: [
                        Text(
                          "Scanner",
                          style: TextStyle(color: Color(0xffff7900)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.qr_code_sharp,
                          color: Color(0xffff7900),
                        )
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<QrCodeResponse> getOmQRImage() async {
    return omService.generateQRCode();
  }
}
