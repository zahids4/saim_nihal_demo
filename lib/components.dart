import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter_counter/counter/view/see_all_plans_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/models/plan.dart';

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
            return SeeAllPlansScreen(plans: [
              Plan(price: 5.99, pricePerTerm: '\$5.99/month', title: '1 month'),
              Plan(
                  price: 39.99,
                  pricePerTerm: '\$39.99/6 months',
                  title: '6 months'),
              Plan(price: 55.99, pricePerTerm: '\$55.99/year', title: '1 year')
            ]);
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
