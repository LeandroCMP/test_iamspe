import 'package:flutter/material.dart';
import 'package:iamspeapp/views/components/text_component.dart';

class CardMenuComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  const CardMenuComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 80,
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        decoration: BoxDecoration(
          color: const Color(0xFFf0f0f0),
          border: Border.all(
            color: const Color(0xFFe6e6e6),
          ),
          borderRadius: BorderRadius.circular(05),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  text: title,
                  textColor: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                TextComponent(
                  text: subtitle,
                  textColor: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
