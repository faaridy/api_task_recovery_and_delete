import 'package:api_task/cubits/products/products_cubit.dart';
import 'package:api_task/ui/trash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrashElementsCount extends StatelessWidget {
  const TrashElementsCount({
    super.key,
    required this.count,
  });
  final String count;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: const TrashPage(),
                    )));
      },
      child: Stack(
        children: [
          const Icon(Icons.restore_from_trash_rounded),
          Positioned(
            right: 2,
            bottom: 8,
            child: ColoredBox(
                color: Colors.red,
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return Text(
                      state is ProductsSuccess
                          ? context
                              .read<ProductsCubit>()
                              .deletedProducts
                              .length
                              .toString()
                          : "",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
