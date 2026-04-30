import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard({required this.tips});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(tips.imageUrl, width: 80),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tips.name, style: blackTextStyle.copyWith(fontSize: 18)),
            SizedBox(height: 4),
            Text(
              "Updated ${tips.updatedAt}",
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.chevron_right, color: greyColor),
      ],
    );
  }
}
