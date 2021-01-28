import 'package:flutter/material.dart';
import 'package:flutter_counter/models/plan.dart';

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