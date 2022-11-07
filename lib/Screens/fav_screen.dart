import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/network.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Provider_St>(
        create: (context) => Provider_St(),
        child: Consumer<Provider_St>(
          
          builder: (context, value, child) => Center(
            child: Column(
              children: [
                Text('${value.counter}'),
                FloatingActionButton(
                  onPressed: () => value.addCounter(),
                  child: const Text('Add'),
                )
              ],
            ),
          ),
        ));
  }
}
