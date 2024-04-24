import 'package:api_task/ui/widgets/products_view.dart';
import 'package:api_task/ui/widgets/trash_elements_count.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Task"), TrashElementsCount(count: "3",)],
        ),
      ),
      body: const ProductsView(),
    );
  }
}
