import 'package:api_task/cubits/products/products_cubit.dart';
import 'package:api_task/ui/widgets/products_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (_, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsSuccess) {
          final products = state.products;
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: products.length,
              itemBuilder: (_, i) => ProductsItem(
                icon: const Icon(Icons.restore_from_trash),
                    onPressed: () {
                      context.read<ProductsCubit>().removeProduct(products[i].id!);
                    },
                    productResponse: products[i],
                  ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
