import 'package:flutter/material.dart';

import '../presentation.dart';

class FiltersListWidget extends StatelessWidget {
  const FiltersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FilterButton(title: 'filtros', hasIcon: true, icon: ImageIcon(AssetImage('assets/icons/filtro.png'), size: 15, color: Colors.black)),
        FilterButton(title: 'com desconto'),
        FilterButton(title: 'disponíveis'),
        FilterButton(title: 'hidro'),
        FilterButton(title: 'piscina'),
        FilterButton(title: 'sauna'),
        FilterButton(title: 'ofurô'),
        FilterButton(title: 'decoração erótica'),
      ],
    );
  }
}
