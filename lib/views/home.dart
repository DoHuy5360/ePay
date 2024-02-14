import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [HeadBar(), Balance(), ArrayOfUtilities()],
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
  const Balance({super.key});

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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your balance",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "1.00\$",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Text(
                  "0963758993",
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
  const ArrayOfUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: const [
          // Grid items
          Utilities(
            navigatePath: "/home",
            label: "QR code",
            icon: Icon(Icons.qr_code_scanner),
          ),
          Utilities(
            navigatePath: "/transaction",
            label: "Transfer",
            icon: Icon(Icons.compare_arrows_sharp),
          ),
          Utilities(
            navigatePath: "/home",
            label: "Pay bill",
            icon: Icon(Icons.blinds_closed),
          ),
          Utilities(
            navigatePath: "/home",
            label: "Gift",
            icon: Icon(Icons.card_giftcard),
          ),
          Utilities(
            navigatePath: "/home",
            label: "Services",
            icon: Icon(Icons.account_balance_outlined),
          ),
          Utilities(
            navigatePath: "/home",
            label: "Get Loan",
            icon: Icon(Icons.local_atm_rounded),
          ),
          Utilities(
            navigatePath: "/home",
            label: "Saving",
            icon: Icon(Icons.savings_outlined),
          ),
          Utilities(
            navigatePath: "/home",
            label: "More",
            icon: Icon(Icons.more_horiz),
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
  const Utilities(
      {super.key,
      required this.label,
      required this.icon,
      required this.navigatePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigatePath);
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
