import 'dart:ffi';

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

class Plan {
  final double price;
  final String pricePerTerm;
  final String title;

  Plan({this.price, this.pricePerTerm, this.title});
}

class SeeAllPlansScreen extends StatelessWidget {
  final List<Plan> plans = <Plan>[
    Plan(price: 5.99, pricePerTerm: '\$5.99/month', title: '1 month'),
    Plan(price: 39.99, pricePerTerm: '\$39.99/6 months', title: '6 months'),
    Plan(price: 55.99, pricePerTerm: '\$55.99/year', title: '1 year')
  ];

  Plan getPlan({int index}) {
    return plans[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premium Plans')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: plans.length,
            itemBuilder: (BuildContext context, int index) {
              final plan = getPlan(index: index);

              return ListTile(
                title: Text(plan.title),
                subtitle: Text(plan.pricePerTerm),
                tileColor: Colors.lightBlue,
                hoverColor: Colors.blueGrey,
                onTap: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                              "Do you want to purchase this plan for ${plan.price}"),
                          content:
                              Text("You will be subscribed for ${plan.title}"),
                          actions: [
                            FlatButton(
                              child: Text("OK"),
                              onPressed: () => {Navigator.of(context).pop()},
                            ),
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () => {Navigator.of(context).pop()},
                            ),
                          ],
                        );
                        ;
                      })
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}

///https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
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
