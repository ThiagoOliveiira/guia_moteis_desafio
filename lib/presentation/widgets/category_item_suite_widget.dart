import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class CategoryItemSuiteWidget extends StatelessWidget {
  const CategoryItemSuiteWidget({
    super.key,
    required this.suite,
  });

  final SuiteEntity? suite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.1,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: suite!.categoriaItens!.length >= 4 ? 4 : suite?.categoriaItens?.length,
          itemBuilder: (context, index) {
            CategoryItemsEntity? categoryItems = suite?.categoriaItens?[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(color: const Color(0xFFF8F9FB), borderRadius: BorderRadius.circular(10)),
                child: Center(child: Image.network(categoryItems?.icone ?? '')),
              ),
            );
          },
        ),
      ),
    );
  }
}
