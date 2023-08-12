import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/home_provider.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(builder: (context, numberProviderModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Homes"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(numberProviderModel.numbers.last.toString()),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("1");
                  },
                ),
              )
            ],
          ));
    });
  }
}
