import 'package:banking_app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

final String incomes = "incomes";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(incomes);
  await Hive.openBox<bool>('settings');
  final bool isFlagSet =
      Hive.box<bool>('settings').get('splash', defaultValue: false) ?? false;
  runApp(BankingApp(
    isFirstOpen: Future<bool>.value(isFlagSet),
  ));
}
