import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
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
                        data: IconThemeData(size: 80, color: Colors.white),
                        child: Icon(Icons.account_balance_outlined)),
                  ),
                ),
              ],
            ),
            const Credentials()
          ],
        ),
      ),
    );
  }
}

class Credentials extends StatefulWidget {
  const Credentials({super.key});

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
          SizedBox(
            width: 100,
            height: 50,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.secondary,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
                  Navigator.pushNamed(context, '/loading');
                  bool isPass = await verifyCredentials();
                  if (!context.mounted) return;
                  if (isPass == true) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    Navigator.of(context).pop();
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
