import 'package:flutter/material.dart';
import 'package:flutter_counter/components.dart';
import 'package:flutter_counter/counter/view/subscription_counter.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wattpad Premium'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Center(
          child: Container(
            height: 400,
            width: 380,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 10),
                    child: Image(
                        image: AssetImage('images/logo.png'),
                        width: 50,
                        height: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Subscribe to Premium Plus",
                        style: textTheme.bodyText1),
                  ),
                  SubscriptionCounter(
                    textTheme: textTheme,
                    subsText: "trialists",
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
                  StartMyFreeWeekButton(
                    buttonTitle: "Start my free week",
                  ),
                  SeeAllPlansButton(
                    buttonTitle: "See All Plans",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
