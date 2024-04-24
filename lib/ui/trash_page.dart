import 'package:api_task/cubits/products/products_cubit.dart';
import 'package:api_task/ui/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Trash Page"),
            ],
          ),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (_, state) {
            return state is ProductsSuccess ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              IconButton(
                  onPressed: () {
                    cubit.deleteProducts();
                  },
                  icon: const Icon(Icons.restore_from_trash_rounded)),
              GridView.builder(
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: cubit.deletedProducts.length,
                  itemBuilder: (_, i) => ProductsItem(
                        icon: const Icon(Icons.replay_circle_filled_rounded),
                        onPressed: () {
                          context.read<ProductsCubit>().recoveryProduct(
                              cubit.deletedProducts[i].id!,
                              cubit.deletedProducts[i]);
                        },
                        productResponse: cubit.deletedProducts[i],
                      ))
            ]) : const SizedBox.shrink(); 
          },
        ));
  }
}
