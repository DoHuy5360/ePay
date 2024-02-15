import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.secondary,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconTheme(
                            data: IconThemeData(
                                color: Theme.of(context).colorScheme.secondary),
                            child: const Icon(Icons.camera_alt))
                      ],
                    ),
                    Text(
                      "ePay",
                      style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconTheme(
                        data: IconThemeData(
                            size: 40,
                            color: Theme.of(context).colorScheme.secondary),
                        child: const Icon(Icons.check_circle)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Transaction successfully!"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1.00\$",
                      style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Section(
                      label: "Beneficiary's name",
                      value: "Do Huy",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Section(
                      label: "Beneficiary's account",
                      value: "0963758993",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Section(
                      label: "Transaction code",
                      value: "i8av80abab34kvo",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Section(
                      label: "Message",
                      value: "Repay the loan",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: IconTheme(
                        data: IconThemeData(
                            color: Theme.of(context).colorScheme.secondary),
                        child: const Icon(Icons.home),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: IconTheme(
                        data: IconThemeData(
                            color: Theme.of(context).colorScheme.secondary),
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String label;
  final String value;
  const Section({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            width: 1, color: Theme.of(context).colorScheme.secondary),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
