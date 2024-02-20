import 'package:flutter/material.dart';
import '../models/login_transfer_data.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final LoginTransferData data =
        ModalRoute.of(context)!.settings.arguments as LoginTransferData;
    return Column(
      children: [
        const HeadBar(),
        Balance(data: data),
        ArrayOfUtilities(
          data: data,
        )
      ],
    );
  }
}

class HeadBar extends StatelessWidget {
  const HeadBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 213, 213, 213)),
            child: IconTheme(
                data: IconThemeData(
                    size: 35, color: Theme.of(context).colorScheme.secondary),
                child: const Icon(Icons.person)),
          ),
          const InkWell(
            child: IconTheme(
                data: IconThemeData(size: 40), child: Icon(Icons.search)),
          )
        ],
      ),
    );
  }
}

class Balance extends StatelessWidget {
  final LoginTransferData data;
  const Balance({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your balance",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  data.balance,
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                ),
                Text(
                  data.id,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red[900]),
                            child: const IconTheme(
                                data: IconThemeData(color: Colors.yellow),
                                child: Icon(Icons.star))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("VN"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ArrayOfUtilities extends StatelessWidget {
  final LoginTransferData data;
  const ArrayOfUtilities({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          // Grid items
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "QR code",
            icon: const Icon(Icons.qr_code_scanner),
          ),
          Utilities(
            data: data,
            navigatePath: "/transaction",
            label: "Transfer",
            icon: const Icon(Icons.compare_arrows_sharp),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "Pay bill",
            icon: const Icon(Icons.blinds_closed),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "Gift",
            icon: const Icon(Icons.card_giftcard),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "Services",
            icon: const Icon(Icons.account_balance_outlined),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "Get Loan",
            icon: const Icon(Icons.local_atm_rounded),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "Saving",
            icon: const Icon(Icons.savings_outlined),
          ),
          Utilities(
            data: data,
            navigatePath: "/home",
            label: "More",
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}

class Utilities extends StatelessWidget {
  final String label;
  final Widget icon;
  final String navigatePath;
  final LoginTransferData data;
  const Utilities({
    super.key,
    required this.label,
    required this.icon,
    required this.navigatePath,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigatePath, arguments: data);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconTheme(
              data: const IconThemeData(size: 30, color: Colors.grey),
              child: icon),
          const SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      ),
    );
  }
}
