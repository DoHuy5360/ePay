import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => TransactionState();
}

class TransactionState extends State<Transaction> {
  String currency = "\$";
  String balance = '1.00';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Balance(currency: currency, balance: balance),
              const SizedBox(
                height: 20,
              ),
              Input(
                label: "Account Number",
                icon: const Icon(Icons.person),
                minLines: 1,
                maxLines: 1,
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.group_sharp),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Input(
                label: "Transaction Information",
                icon: const Icon(Icons.attach_money_rounded),
                minLines: 1,
                maxLines: 1,
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.currency_exchange),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Input(
                label: "Message",
                icon: const Icon(Icons.messenger),
                minLines: 4,
                maxLines: 5,
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.edit),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: Material(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.pushNamed(context, "/order");
                },
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
  final Widget icon;
  final List<Widget> actions;
  final int minLines;
  final int maxLines;

  const Input(
      {super.key,
      required this.label,
      required this.icon,
      required this.minLines,
      required this.maxLines,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  minLines: minLines,
                  maxLines: maxLines,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(height: 1),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "This field can not empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: actions,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class Balance extends StatelessWidget {
  const Balance({
    super.key,
    required this.currency,
    required this.balance,
  });

  final String currency;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your balance",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 20),
        ),
        Text(
          "$currency $balance",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ],
    );
  }
}
