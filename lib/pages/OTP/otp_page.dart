import 'dart:developer';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/pages/Final%20Page/last_page.dart';
import 'package:login/util/snack_bar.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String name, number;
  const OtpPage({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  bool sentOTP = false;
  bool isLoading = true;
  String verificationId = "";

  @override
  void initState() {
    super.initState();
    sendOTP();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    controller.dispose();
  }

  Future<void> sendOTP() async {
    var instance = FirebaseAuth.instance;
    instance.verifyPhoneNumber(
      phoneNumber: "+91${widget.number}",
      verificationCompleted: (credential) async {
        setState(() {
          isLoading = false;
        });
      },
      verificationFailed: (failed) async {},
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          sentOTP = true;
          this.verificationId = verificationId;
          isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  Widget buildPinPut() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 243, 244, 249),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 135, 135, 135)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromARGB(255, 121, 124, 126),
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      controller: controller,
      pinputAutovalidateMode: PinputAutovalidateMode.disabled,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      showCursor: true,
      onCompleted: (pin) {
        if (pin == verificationId) {
          Get.offAll(() {
            return const LastPage(title: "You have Logged in!!");
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Welcome ${widget.name}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Row(
                children: [
                  !sentOTP
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                        )
                      : const Icon(
                          Icons.check_circle_outline,
                          color: Colors.greenAccent,
                          size: 40,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      !sentOTP
                          ? 'Sending OTP'
                          : 'OTP send to the mobile number ${widget.number} ',
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/otp.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildPinPut(),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    sentOTP = !sentOTP;
                  });
                  sendOTP();
                },
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Didnt Receive a Code?',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' Resend Code',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: controller.text),
                  )
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LastPage(title: "You have Logged in")),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  showSnackbar(context, "Invalid OTP!!");
                }
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
