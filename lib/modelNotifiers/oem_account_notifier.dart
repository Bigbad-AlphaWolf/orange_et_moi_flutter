import 'package:flutter/foundation.dart';
import 'package:orange_et_moi/model/account_oem_infos.dart';

class OeMAccountNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  AccountOeMInfos? _accountOeMInfos;

  AccountOeMInfos? get infos => _accountOeMInfos;

  void updateInfos(AccountOeMInfos data) {
    _accountOeMInfos = data;
    notifyListeners();
  }

  /// Makes `OeMAccountNotifier` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('firstName', _accountOeMInfos?.firstName));
  }
}
