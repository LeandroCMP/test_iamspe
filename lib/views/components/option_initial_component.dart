import 'package:flutter/material.dart';

class OptionInitialPage extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  final String text;
  const OptionInitialPage({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        height: 80,
        width: 150,
        padding: const EdgeInsets.all(05),
        decoration: BoxDecoration(
          color: const Color(0xFFf0f0f0),
          border: Border.all(color: const Color(0xFFeaeaea)),
          borderRadius: BorderRadius.circular(08),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
