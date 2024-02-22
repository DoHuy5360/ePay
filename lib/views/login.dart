import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_transfer_data.dart';
import 'package:intl/intl.dart';
import '../config.dart';
import '../utilities/request.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  final Config config;
  const LoginView({super.key, required this.config});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.secondary,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("images/login-bg-curve.png"),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: IconTheme(
                        data: IconThemeData(size: 60, color: Colors.white),
                        child: Icon(Icons.account_balance_outlined)),
                  ),
                ),
              ],
            ),
            Credentials(
              config: widget.config,
            )
          ],
        ),
      ),
    );
  }
}

class Credentials extends StatefulWidget {
  final Config config;
  const Credentials({super.key, required this.config});

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  final _formKey = GlobalKey<FormState>();
  String _phone = "", _password = "";

  Future<LoginTransferData?> verifyCredentials() async {
    var response = await Request.post(widget.config.getApi().login(),
        {"phone": _phone, "password": _password});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return LoginTransferData(
          name: data["name"], balance: data["balance"], id: data["id"]);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                      label: "Phone",
                      onSaved: (value) {
                        _phone = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone can not empty.';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Input(
                      label: "Password",
                      onSaved: (value) {
                        _password = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can not empty.';
                        }
                        return null;
                      }),
                ],
              )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.secondary,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/loading');
                    _formKey.currentState!.save();
                    LoginTransferData? isPass = await verifyCredentials();
                    if (!context.mounted) return;
                    if (isPass != null) {
                      Navigator.pushReplacementNamed(context, '/home',
                          arguments: isPass);
                    } else {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String label;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const Input(
      {super.key,
      required this.label,
      required this.onSaved,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    const double radius = 10;
    return TextFormField(
        validator: validator,
        onSaved: onSaved,
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: label,
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                  width: 2, color: Theme.of(context).colorScheme.secondary),
            )));
  }
}
