import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class CarouselItemsWidget extends StatelessWidget {
  final MotelEntity? motel;

  const CarouselItemsWidget({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        itemCount: motel?.suites?.length ?? 0,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          SuiteEntity? suite = motel?.suites?[index];
          return Column(
            children: [
              ImageCarouseWidget(suite: suite),
              const SizedBox(height: 5),
              suite?.qtd == 0 ? const UnavailableSuiteWidget() : const SizedBox.shrink(),
              const SizedBox(height: 5),
              CategoryItemSuiteWidget(suite: suite),
              ListPeriodWidget(suite: suite)
            ],
          );
        },
      ),
    );
  }
}
