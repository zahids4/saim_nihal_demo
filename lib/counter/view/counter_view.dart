import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Wattpad Premium')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
              child: Image(
                  image: AssetImage('images/logo.png'), width: 50, height: 50),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child:
                  Text("Subscribe to Premium Plus", style: textTheme.bodyText1),
            ),
            SubscriptionCounter(
              textTheme: textTheme,
              subsText: "trialists",
            ),
            StartMyFreeWeekButton(
              buttonTitle: "Start my free week",
            ),
            SeeAllPlansButton(
              buttonTitle: "See All Plans",
            )
          ],
        ),
      ),
    );
  }
}

class SeeAllPlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premium Plans')),
      body: Center(
        child: FlatButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SeeAllPlansButton extends StatelessWidget {
  const SeeAllPlansButton({Key key, @required this.buttonTitle})
      : super(key: key);

  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SeeAllPlansScreen();
          }));
        },
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.lightBlue),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.lightBlue)));
  }
}

class StartMyFreeWeekButton extends StatelessWidget {
  const StartMyFreeWeekButton({Key key, @required this.buttonTitle})
      : super(key: key);

  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.orange),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.orange)));
  }
}

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
          padding: const EdgeInsets.all(20.0),
          child: Text('$state' + ' $subsText', style: textTheme.headline2),
        );
      },
    );
  }
}
