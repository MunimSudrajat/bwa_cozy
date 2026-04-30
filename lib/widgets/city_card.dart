import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({required this.city});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: Stack(
        alignment: AlignmentGeometry.topEnd,
        children: [
          Container(
            height: 150,
            width: 102,
            color: Color(0xffF6F7F8),
            child: Column(
              children: [
                Image.asset(city.imageUrl, fit: BoxFit.cover),
                SizedBox(height: 11),
                Text(city.name, style: blackTextStyle.copyWith(fontSize: 16)),
              ],
            ),
          ),
          city.isPopular
              ? Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/icon_star.png',
                      width: 22,
                      height: 22,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
