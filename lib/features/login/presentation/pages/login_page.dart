import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:texnomart/features/home/presentation/pages/home_page.dart';
import 'package:texnomart/features/login/presentation/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController channelController = TextEditingController();
  late TextEditingController eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: channelController,
                height: 50,
                hintText: 'Channel name',
                autofocus: true,
              ),
              const SizedBox(height: 8),
              CustomTextField(controller: eventController, height: 50, hintText: 'Event name'),
              const SizedBox(height: 8),
              MaterialButton(
                height: 40,
                color: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  if (channelController.text.trim().isNotEmpty && eventController.text.trim().isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage(channel: channelController.text.trim(), event: eventController.text.trim());
                        },
                      ),
                    );
                  } else {
                    HapticFeedback.heavyImpact();
                    Fluttertoast.showToast(msg: "Please fill Textfields below 😊️️️️️️", gravity: ToastGravity.TOP);
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login_rounded, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Connect',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
