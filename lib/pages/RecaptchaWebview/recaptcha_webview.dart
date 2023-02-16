import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class RecaptchaWebview extends StatefulWidget {
  const RecaptchaWebview({super.key});

  @override
  State<RecaptchaWebview> createState() => _RecaptchaWebviewState();
}

class _RecaptchaWebviewState extends State<RecaptchaWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          replacement: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Veuilllez patienter"),
            ],
          )),
          child: SizedBox(
            child: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                controller.loadUrl("assets/webpages/index.html");
              },
              javascriptChannels: <JavascriptChannel>{
                JavascriptChannel(
                  name: 'messageHandler',
                  onMessageReceived: (JavascriptMessage response) {
                    Navigator.pop(context, response.message);
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                )
              },
            ),
          ),
        ),
      ),
    );
  }
}
