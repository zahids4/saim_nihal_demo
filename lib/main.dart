import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/demo.dart';

import 'app.dart';
import 'counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  var orbiter = Orbiter('Orbiter I', DateTime(1977, 9, 5), 1000.13);
  orbiter.describe();

  Functions funcs = Functions();
  print("WOW COOL DEMO");
  print(funcs.demo());
  runApp(const CounterApp());
}
