import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:orange_et_moi/model/user_telco_conso.dart';
import 'package:orange_et_moi/pages/DashboardScreen/TabScreen/components/dashboard_telco_details_list.dart';
import 'package:skeletons/skeletons.dart';

class DashboardSuiviConso extends StatelessWidget {
  const DashboardSuiviConso({
    Key? key,
    required Future<Response<dynamic>> userConso,
  })  : _userConso = userConso,
        super(key: key);

  final Future<Response<dynamic>> _userConso;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<Response<dynamic>>(
          future: _userConso,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 4,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 100,
                      width: 100,
                      minLength: MediaQuery.of(context).size.width / 6,
                      maxLength: MediaQuery.of(context).size.width / 3,
                    )),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text(
                  'Une erreur est survenue',
                );
              } else if (snapshot.hasData) {
                final bool fromCache = snapshot.data!.headers
                            .value(DIO_CACHE_HEADER_KEY_DATA_SOURCE) !=
                        null
                    ? true
                    : false;
                final List<TelcoConsoModel> response =
                    telcoConsoModelFromJson(snapshot.data!.data);

                final consoByCategory = getListCategoryConso(response);
                return Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Suivi conso",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "HelveticaNeueLTStd-Bd"),
                        ),
                        fromCache == true
                            ? Text("Mettre à jour",
                                style: TextStyle(
                                    decoration: TextDecoration.underline))
                            : Text(""),
                      ],
                    ),
                    Column(
                      children: consoByCategory.keys
                          .map((e) => UserTelcoDetails(
                              category: e, listConso: consoByCategory[e]!))
                          .toList(),
                    )
                  ],
                );
              }
              return const SizedBox();
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
        ),
      ],
    );
  }

  Map<String, List<TelcoConsoModel>> getListCategoryConso(
      List<TelcoConsoModel> userConso) {
    Map<String, List<TelcoConsoModel>> consoDisplay = {};
    final callCategoryConso =
        userConso.where((value) => value.typeCompteur == "APPEL").toList();
    final smsCategoryConso =
        userConso.where((value) => value.typeCompteur == "SMS").toList();
    final dataCategoryConso =
        userConso.where((value) => value.typeCompteur == "INTERNET").toList();

    if (callCategoryConso.isNotEmpty) {
      consoDisplay["APPEL"] = callCategoryConso;
    }
    if (smsCategoryConso.isNotEmpty) {
      consoDisplay["SMS"] = smsCategoryConso;
    }
    if (dataCategoryConso.isNotEmpty) {
      consoDisplay["INTERNET"] = dataCategoryConso;
    }

    return consoDisplay;
  }
}
