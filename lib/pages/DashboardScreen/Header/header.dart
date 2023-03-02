import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/account_oem_infos.dart';
import 'package:orange_et_moi/services/file_manager/file_manager.service.dart';
import 'package:orange_et_moi/services/telco_infos/telco_infos.dart';
import 'package:skeletons/skeletons.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TelcoInfosService telcoInfosService = TelcoInfosService();
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
              GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: FutureBuilder(
                      future: getAccountInfos(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 40),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasData) {
                            AccountOeMInfos infos = snapshot.data!;
                            FileManagerService fileManagerService =
                                FileManagerService();
                            String imgUrl = fileManagerService
                                .getImageUrl(infos.imageProfil);
                            return ClipOval(
                              child: Image.network(imgUrl,
                                  errorBuilder: (context, error, stackTrace) {
                                return Image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/icons-profil-profil.png"),
                                );
                              }, fit: BoxFit.cover, height: 40, width: 40),
                            );
                          }
                        }
                        return Text("Une erreur est survenue");
                      }))),
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

  Future<AccountOeMInfos> getAccountInfos() async {
    return await telcoInfosService.getAccountInfos(false);
  }
}
