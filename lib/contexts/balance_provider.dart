import 'package:flutter/foundation.dart';

class BalanceProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _balance = "";

  String get balance => _balance;

  void updateBalance(newBalance) {
    _balance = newBalance;
    notifyListeners();
  }
}
