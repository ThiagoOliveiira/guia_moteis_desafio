import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ImageCarouseWidget extends StatelessWidget {
  const ImageCarouseWidget({
    super.key,
    required this.suite,
  });

  final SuiteEntity? suite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: CachedNetworkImageProvider(suite?.fotos?.first ?? '', maxHeight: (MediaQuery.sizeOf(context).height * 0.24).toInt()),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(suite?.nome?.toLowerCase() ?? 'N/I', overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    suite?.exibirQtdDisponiveis == true ? const Icon(Icons.info_outline, color: Colors.red, size: 12) : const SizedBox.shrink(),
                    const SizedBox(width: 3),
                    Text(
                      suite?.exibirQtdDisponiveis == true ? "só mais ${suite?.qtd} pelo app" : "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.w600, height: 0),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
