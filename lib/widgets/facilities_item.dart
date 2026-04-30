import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class FacilitiesItem extends StatelessWidget {
  final String imageUrl;
  final String qty;
  final String name;

  FacilitiesItem({
    required this.imageUrl,
    required this.qty,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imageUrl, width: 32),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: '$qty',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(text: name, style: greyTextStyle.copyWith(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
