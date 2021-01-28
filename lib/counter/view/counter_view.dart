import 'package:flutter/material.dart';
import 'package:flutter_counter/components.dart';
import 'package:flutter_counter/counter/view/subscription_counter.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          child: CarouselSlider(
            options:
                CarouselOptions(height: 600.0, enableInfiniteScroll: false),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 350,
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
                            padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                            child: Text("Subscribe to Premium Plus",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          SubscriptionCounter(
                            textTheme: textTheme,
                            subsText: "trialists",
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
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
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
