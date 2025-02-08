import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class MotelListWidget extends StatelessWidget {
  const MotelListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.dataMotelEntity?.totalMoteis,
          itemBuilder: (context, index) {
            MotelEntity? motel = state.dataMotelEntity?.moteis?[index];

            return Column(
              children: [
                ListTileCardMotelWidget(motel: motel),
                CarouselItemsWidget(motel: motel),
              ],
            );
          },
        );
      },
    );
  }
}
