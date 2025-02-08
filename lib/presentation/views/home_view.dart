import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../injection_container.dart';
import '../presentation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => sl<HomeCubit>()..init(),
      child: Scaffold(
        backgroundColor: const Color(0xFFD11621),
        appBar: defaultAppBar(context),
        body: SafeArea(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0), borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return switch (state.status) {
                  HomeStatus.loading => const Center(child: CircularProgressIndicator(color: Color(0xFFD11621))),
                  HomeStatus.failure => const Center(child: Text("Erro: ")),
                  _ => SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const PromotionMotelCardWidget(),
                          StickyHeader(
                            header: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE1E1E1), width: 1.5)), color: Color(0xFFF8F9FB)),
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: FiltersListWidget()),
                              ),
                            ),
                            content: Container(
                              color: const Color(0xFFF8F9FB),
                              child: const Column(
                                children: [MotelListWidget()],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
