import 'package:flutter/material.dart';
import 'package:orange_et_moi/services/otp/otp.service.dart';
import 'package:pinput/pinput.dart';

class TypeCodeOTP extends StatefulWidget {
  const TypeCodeOTP(this.msisdn, {super.key});

  final String msisdn;
  @override
  State<TypeCodeOTP> createState() => _TypeCodeOTPState();
}

class _TypeCodeOTPState extends State<TypeCodeOTP> {
  final OTPService otpService = OTPService();
  String? _errorText;
  bool _isLoading = false;
  final pinController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: IconButton(
                padding: EdgeInsets.only(left: 0),
                icon: Icon(Icons.arrow_back),
                onPressed: () => {Navigator.pop(context)},
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Code OTP",
              style:
                  TextStyle(fontFamily: 'HelveticaNeueLTStd-Bd', fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Renseigner le code OTP reçu sur le numéro 781210942",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "HelveticaNeueLTStd-Roman",
                    color: Color(0xff666666))),
            SizedBox(
              height: 25,
            ),
            Pinput(
              errorText: _errorText,
              forceErrorState: _errorText == null ? false : true,
              controller: pinController,
              closeKeyboardWhenCompleted: true,
              length: 4,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Color(0xFFff7900)),
                borderRadius: BorderRadius.circular(8),
              ),
              errorPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Color.fromARGB(255, 255, 0, 0)),
                borderRadius: BorderRadius.circular(8),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                color: Color.fromRGBO(234, 239, 243, 1),
              )),
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => validateOTP(pin),
            ),
            SizedBox(
              height: 20,
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
                onPressed: _isLoading
                    ? null
                    : () {
                        if (pinController.text.length == 4) {
                          validateOTP(pinController.text);
                        }
                      },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Suivant',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future validateOTP(String code) async {
    print("call");
    try {
      setState(() {
        _isLoading = true;
      });
      final validateOTPResponse =
          await (otpService.validateOTPForLogin(widget.msisdn, code));
      if (validateOTPResponse.valid == true) {
        if (mounted) {
          Navigator.pop(context, true);
        }
      } else {
        print("fallle");
        setState(() {
          _errorText = "Le code saisi est erroné ou a expiré.";
        });
      }
    } catch (e) {
      setState(() {
        _errorText = "Veuillez vérifier votre connexion puis réssayer.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
