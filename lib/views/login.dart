import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Future<bool> verifyCredentials() async {
    print('Verifying credentials');
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Input(
            label: "Phone",
          ),
          const SizedBox(
            height: 16,
          ),
          const Input(
            label: "Password",
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/loading');
                bool isPass = await verifyCredentials();
                if (!context.mounted) return;
                if (isPass == true) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Login"))
        ],
      )),
    );
  }
}

class Input extends StatelessWidget {
  final String label;
  const Input({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          labelText: label),
    );
  }
}