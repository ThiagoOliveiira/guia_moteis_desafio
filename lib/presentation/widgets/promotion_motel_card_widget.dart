import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class PromotionMotelCardWidget extends StatelessWidget {
  const PromotionMotelCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.27,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: context.read<HomeCubit>().discountedSuites!.length,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              SuiteEntity? suite = context.read<HomeCubit>().discountedSuites?[index];
              MotelEntity? motel = state.dataMotelEntity?.moteis?.first;
              return Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: LayoutBuilder(builder: (context, cts) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(suite?.fotos?.first ?? '', fit: BoxFit.cover, height: cts.maxHeight),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/icons/fire.png', height: 20),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(state.dataMotelEntity?.moteis?.first.fantasia?.toLowerCase() ?? 'N/I',
                                              overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 0, overflow: TextOverflow.ellipsis)),
                                          Text(
                                            motel?.bairro?.toLowerCase() ?? 'N/I',
                                            style: const TextStyle(fontSize: 12, height: 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: DecoratedBox(
                                  decoration: const BoxDecoration(color: Color(0xFFF8F9FB), borderRadius: BorderRadius.all(Radius.circular(5))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('30% de desconto', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline)),
                                        const Divider(color: Colors.white, indent: 15, endIndent: 15, thickness: 2),
                                        Text('a partir de ${UtilBrasilFields.obterReal(suite?.periodos?.first.valor ?? 0)}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF1ABA8E),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    fixedSize: const Size.fromHeight(1),
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('reservar', style: TextStyle(color: Colors.white, height: 0)),
                                      SizedBox(width: 3),
                                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        );
      },
    );
  }
}
