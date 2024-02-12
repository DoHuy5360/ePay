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
                data: IconThemeData(size: 35, color: Colors.blue),
                child: Icon(Icons.person)),
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
            color: Colors.blue[300], borderRadius: BorderRadius.circular(15)),
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
            label: "QR code",
            icon: Icon(Icons.qr_code_scanner),
          ),
          Utilities(
            label: "Transfer",
            icon: Icon(Icons.compare_arrows_sharp),
          ),
          Utilities(
            label: "Pay bill",
            icon: Icon(Icons.blinds_closed),
          ),
          Utilities(
            label: "Gift",
            icon: Icon(Icons.card_giftcard),
          ),
          Utilities(
            label: "Services",
            icon: Icon(Icons.account_balance_outlined),
          ),
          Utilities(
            label: "Get Loan",
            icon: Icon(Icons.local_atm_rounded),
          ),
          Utilities(
            label: "Saving",
            icon: Icon(Icons.savings_outlined),
          ),
          Utilities(
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
  const Utilities({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
