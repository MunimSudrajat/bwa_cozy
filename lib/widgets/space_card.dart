import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/detail_space.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard({required this.space});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailSpace(space)),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icon_star.png',
                          width: 18,
                          height: 18,
                        ),
                        Text(
                          "${space.rating}/5",
                          style: whiteTextStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.name, style: blackTextStyle.copyWith(fontSize: 18)),
              Text.rich(
                TextSpan(
                  text: "\$${space.price}",
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: " / month",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "${space.city}, ${space.country}",
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
