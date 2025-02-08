import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ListTileCardMotelWidget extends StatelessWidget {
  final MotelEntity? motel;
  const ListTileCardMotelWidget({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.07, right: MediaQuery.sizeOf(context).width * 0.07),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(backgroundImage: NetworkImage(motel?.logo ?? '')),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(motel?.fantasia?.toLowerCase() ?? 'N/I', style: const TextStyle(fontSize: 24, height: 0)),
            Text(motel?.bairro?.toLowerCase() ?? 'N/I'),
          ],
        ),
        dense: true,
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.amber), borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 12),
                        const SizedBox(width: 3),
                        Text(motel?.media.toString() ?? '0.0', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Text('${motel?.qtdAvaliacoes} avaliações', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, height: 0)),
                      const Icon(Icons.keyboard_arrow_down_rounded, size: 12),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.favorite, color: Color(0xFFC2C2C2)),
      ),
    );
  }
}
