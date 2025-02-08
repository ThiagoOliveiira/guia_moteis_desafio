import 'package:flutter/material.dart';

class UnavailableSuiteWidget extends StatelessWidget {
  const UnavailableSuiteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      width: MediaQuery.sizeOf(context).width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('indisponível no app', style: TextStyle(color: Color(0xFFAD2770), fontWeight: FontWeight.w600)),
          TextButton.icon(
            onPressed: () {},
            label: const Text('avise-me', style: TextStyle(color: Colors.white)),
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFFAD2770)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
        ],
      ),
    );
  }
}
