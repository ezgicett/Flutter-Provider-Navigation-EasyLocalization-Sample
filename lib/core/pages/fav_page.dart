import 'package:dice_app/providers/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Experiences"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Dart Knowledge"),
                      subtitle: Consumer<Counter>(
                        builder: (context, counter, child) => Text(
                          '${counter.value}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          var counter = context.read<Counter>();
                          counter.increment();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
