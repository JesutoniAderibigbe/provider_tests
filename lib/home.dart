import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_test/firebase_provider.dart";
import "package:provider_test/home2.dart";
import "package:provider_test/theme_provider.dart";

import "home_provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () {
              print("Toggle Theme");
              themeProvider.toggleTheme(); // Toggle the theme mode
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              // Check if the user is signed in
              if (authProvider.user != null) {
                return Text("Hello, ${authProvider.user!.email}");
              } else {
                return Text("Not logged in");
              }
            },
          ),
          Consumer<NumberListProvider>(
            builder: (context, numberProviderModel, child) {
              return Column(
                children: [
                  Text("Number Provider: ${numberProviderModel.numbers.last}"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        numberProviderModel.numbers
                            .add(numberProviderModel.numbers.last + 1);
                      });
                    },
                    child: const Text("Add Number"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
