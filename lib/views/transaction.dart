import 'dart:convert';

import 'package:epay/config.dart';
import 'package:epay/models/transaction_transfer_data.dart';
import 'package:epay/utilities/request.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/login_transfer_data.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Transaction extends StatefulWidget {
  final Config config;
  const Transaction({super.key, required this.config});

  @override
  State<Transaction> createState() => TransactionState();
}

class TransactionState extends State<Transaction> {
  final _formKey = GlobalKey<FormState>();
  bool _isShowRecentReceivers = false;
  TextEditingController accountInputController = TextEditingController();
  String accountNumber = "65c4e2fb42a685f76a7b1691";
  String fluctuation = "";
  void _toggleShowRecentReceivers() {
    setState(() {
      _isShowRecentReceivers = !_isShowRecentReceivers;
    });
  }

  Future<TransactionTransferData?> _makeTransaction() async {
    var response = await Request.put(widget.config.getApi().updateTransaction(),
        {"id": accountNumber, "fluctuation": fluctuation});
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return TransactionTransferData(
          name: data["name"], balance: fluctuation, id: accountNumber);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LoginTransferData data =
        ModalRoute.of(context)!.settings.arguments as LoginTransferData;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Balance(balance: data.balance),
                const SizedBox(
                  height: 20,
                ),
                Input(
                  onSaved: null,
                  textEditingController: accountInputController,
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
                      onTap: _toggleShowRecentReceivers,
                      child: const Icon(Icons.group_sharp),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _isShowRecentReceivers,
                  child: AnimatedContainer(
                    color: Colors.blue,
                    duration: const Duration(milliseconds: 500),
                    width: _isShowRecentReceivers
                        ? MediaQuery.of(context).size.width
                        : 0.0,
                    height: _isShowRecentReceivers ? 200.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconTheme(
                                data: IconThemeData(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                child: const Icon(Icons.person)),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                accountInputController.text = accountNumber;
                                _toggleShowRecentReceivers();
                              },
                              child: Text(
                                accountNumber,
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Input(
                  onSaved: (value) {
                    fluctuation = value!;
                  },
                  textEditingController: null,
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
                  onSaved: null,
                  textEditingController: null,
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
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      TransactionTransferData? isPass =
                          await _makeTransaction();
                      if (!context.mounted) return;
                      if (isPass != null) {
                        Navigator.pushNamed(context, '/order',
                            arguments: isPass);
                      } else {}
                    }
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
      ),
    );
  }
}

class Input extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String?)? onSaved;
  final String label;
  final Widget icon;
  final List<Widget> actions;
  final int minLines;
  final int maxLines;

  const Input(
      {super.key,
      required this.onSaved,
      required this.textEditingController,
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
                  onSaved: onSaved,
                  controller: textEditingController,
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
    required this.balance,
  });

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
          detectCurrency(balance),
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ],
    );
  }
}
