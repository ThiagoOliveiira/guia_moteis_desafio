import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ListPeriodWidget extends StatelessWidget {
  const ListPeriodWidget({super.key, required this.suite});

  final SuiteEntity? suite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: suite?.periodos
              ?.map(
                (periodo) => Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        suite?.qtd == 0 ? const VerticalDivider(thickness: 2, color: Color(0xFF989898)) : const SizedBox.shrink(),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  periodo.tempoFormatado ?? 'NI',
                                  style: TextStyle(fontSize: 20, color: suite?.qtd == 0 ? const Color(0xFFA2A2A2) : null),
                                ),
                                const SizedBox(width: 5),
                                periodo.desconto != null
                                    ? Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen), borderRadius: BorderRadius.circular(30)),
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [Text('10%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.lightGreen))],
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  UtilBrasilFields.obterReal(periodo.valor ?? 0),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: suite?.qtd == 0 || periodo.desconto != null ? const Color(0xFFA2A2A2) : null,
                                    decoration: periodo.desconto != null ? TextDecoration.lineThrough : null,
                                    decorationColor: const Color(0xFFA2A2A2),
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                periodo.desconto != null
                                    ? Text(
                                        UtilBrasilFields.obterReal(periodo.valorTotal ?? 0),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: suite?.qtd == 0 ? const Color(0xFFA2A2A2) : null,
                                          height: 0,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              )
              .toList() ??
          [],
    );
  }
}
