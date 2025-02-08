import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

AppBar defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFFD11621),
    toolbarHeight: MediaQuery.sizeOf(context).height * 0.12,
    automaticallyImplyLeading: true,
    elevation: 0,
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.zero,
      child: TextButton.icon(
        label: const Text('sp', style: TextStyle(color: Colors.white)),
        onPressed: () {},
        iconAlignment: IconAlignment.end,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
        style: const ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(decorationStyle: TextDecorationStyle.dotted))),
      ),
    ),
    title: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ImageIcon(AssetImage('assets/icons/menus.png'), size: 24, color: Colors.white),
          Column(
            children: [
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [Colors.white],
                  [Colors.white]
                ],
                activeFgColor: Colors.black,
                inactiveBgColor: const Color(0xFFB8000C),
                inactiveFgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: const ['ir agora', 'ir outro dia'],
                icons: const [Icons.flash_on_rounded, Icons.calendar_month_outlined],
                radiusStyle: true,
                customWidths: [MediaQuery.sizeOf(context).width * 0.34, MediaQuery.sizeOf(context).width * 0.34],
                onToggle: (index) {},
              ),
            ],
          ),
          const Icon(Icons.search, color: Colors.white),
        ],
      ),
    ),
  );
}
