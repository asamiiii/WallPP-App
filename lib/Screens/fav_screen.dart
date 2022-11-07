import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/network.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    return Column(
      children: [
        Text('${myProvider.counter}'),
        FloatingActionButton(
          onPressed: () => myProvider.addCounter(),
          child: const Text('Add'),
        )
      ],
    );
  }
}
