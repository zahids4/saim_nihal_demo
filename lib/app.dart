import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/view/counter_page.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class CounterApp extends MaterialApp {
  /// {@macro counter_app}
  /// why we need keys https://stackoverflow.com/questions/50080860/what-are-keys-in-the-stateless-widgets-class
  const CounterApp({Key key}) : super(key: key, home: const CounterPage());
}
