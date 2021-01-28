import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';

class SubscriptionCounter extends StatelessWidget {
  const SubscriptionCounter(
      {Key key, @required this.textTheme, @required this.subsText})
      : super(key: key);

  final TextTheme textTheme;
  final String subsText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('$state' + ' $subsText',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 35)),
        );
      },
    );
  }
}
