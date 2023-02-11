import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_et_moi/model/check_number.dart';
import 'package:orange_et_moi/model/confirm_msisdn.dart';
import 'package:orange_et_moi/model/token_response.dart';
import 'package:orange_et_moi/pages/utils/index.dart';
import 'package:orange_et_moi/pages/utils/pipes.dart';
import 'package:orange_et_moi/services/authentication/authentication.service.dart';
import 'package:orange_et_moi/services/navigation/app_navigation.dart';
import 'package:orange_et_moi/services/secure_storage/secure_storage.service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  String? _text;
  String? _errorText;
  bool _loading = false;
  AuthenticationService authenticationService = AuthenticationService();
  SecureStorage storage = SecureStorage();
  AppNavigation navigation = AppNavigation();
  @override
  void initState() {
    super.initState();
    getMsisdn();
  }

  @override
  bool get mounted => super.mounted;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     // Status bar brightness (optional)
      //     statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
      //   ),
      // ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => {Navigator.of(context).pop()},
                          ),
                        ),
                        SizedBox(
                          child: SvgPicture.asset("assets/images/sim-icon.svg"),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Numéro de téléphone",
                          style: TextStyle(
                              fontSize: 34,
                              fontFamily: 'HelveticaNeueLTStd-Bd'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Veuillez saisir votre numéro de téléphone ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 102, 102),
                              fontSize: 16,
                              fontFamily: 'HelveticaNeueLTStd-Roman'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Note: Same code is applied for the TextFormField as well
                        TextField(
                          controller: _controller,
                          style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'HelveticaNeueLTStd-Bd'),
                          keyboardType: TextInputType.number,
                          onChanged: (text) => setState(() => _text),
                          decoration: InputDecoration(
                            errorText: _errorText,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.12)), //<-- SEE HERE
                            ),
                            labelText: 'Numéro de téléphone *',
                            suffix: GestureDetector(
                              onTap: () {
                                getMsisdn();
                              },
                              child: Text(
                                "Rafraîchir",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'HelveticaNeueLTStd-Bd'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFFff7900),
                              disabledBackgroundColor: Color(0xFFcccccc),
                            ),
                            onPressed: _loading ? null : _submit,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Suivant',
                                  style: TextStyle(fontSize: 16),
                                ),
                                _showLoading()
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _showLoading() {
    return _loading
        ? Container(
            margin: EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 10,
              height: 10,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          )
        : SizedBox();
  }

  void _checkErrorInvalidNumber() {
    // at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (!regexValideMobileNumber.hasMatch(text)) {
      setState(() {
        _errorText = 'Veuillez  renseigner un numéro mobile valide';
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  void _submit() {
    _checkErrorInvalidNumber();
    if (_errorText == null) {
      // proceed
      checkNumber();
    }
  }

  Future getMsisdn() async {
    final ConfirmMsisdnNetwork? resp =
        (await AuthenticationService().getNumberFromNetwork());
    print("response ${resp?.msisdn}");
    if (resp != null) {
      _controller.text = formatGetMsisdn(resp.msisdn);
      saveInfosNetwork(resp);
    }
  }

  Future checkNumber() async {
    try {
      setState(() {
        _loading = true;
      });
      CheckNumber response =
          (await AuthenticationService().checkNumber(_controller.text));
      print(response.accountStatus);
      if (response.accountStatus == AccountStatusEnum.LITE.name) {
        resetPwd();
      }
    } catch (e) {
      print("Une erreur est ${e.toString()}");
      setState(() {
        _loading = false;
      });
    }
  }

  Future resetPwd() async {
    try {
      await AuthenticationService().resetPasswordLite(_controller.text);
      if (mounted) {
        navigation.goToDashboard(context);
      }
    } catch (e) {
      setState(() {
        _errorText = 'Impossible de se connecter. Veuillez réessayer plus tard';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future saveInfosNetwork(ConfirmMsisdnNetwork info) async {
    await storage.save(StorageKeys.HMAC.name, info.hmac);
    await storage.save(
        StorageKeys.MSISDN_NETWORK.name, formatGetMsisdn(info.msisdn));
  }
}
