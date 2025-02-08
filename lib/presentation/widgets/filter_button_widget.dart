import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Widget? icon;
  final bool? hasIcon;
  final String title;
  const FilterButton({super.key, required this.title, this.hasIcon = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.04,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFE1E1E1), width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hasIcon == true || icon != null ? icon! : const SizedBox.shrink(),
              SizedBox(width: hasIcon == true ? 5 : 0),
              Text(title, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
