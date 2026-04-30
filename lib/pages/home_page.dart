import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/pages/detail_space.dart';
import 'package:bwa_cozy/providers/space_providers.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'bottom_navbar_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProviders>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            //NOTE : TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(fontSize: edge),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            //NOTE : POPPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 24),
                  CityCard(
                    city: City(
                      id: 1,
                      name: "Jakarta",
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    city: City(
                      id: 2,
                      name: "Bandung",
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    city: City(
                      id: 3,
                      name: "Surabaya",
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
            SizedBox(height: 30),
            //NOTE : RECOMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recomended Space",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: FutureBuilder<List<Space>>(
                future: spaceProvider.getRecomendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data!;
                    int index = 0;
                    return Column(
                      children: [
                        ...data.map((item) {
                          index++;
                          return Container(
                            child: SpaceCard(space: item),
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          );
                        }).toList(),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            //NOTE : TIPS & GUIDANCE
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recomended Space",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    tips: Tips(
                      id: 1,
                      name: "City Guidlines",
                      imageUrl: "assets/images/tips1.png",
                      updatedAt: "20 Apr",
                    ),
                  ),
                  SizedBox(height: 20),
                  TipsCard(
                    tips: Tips(
                      id: 1,
                      name: "Jakarta Fairship",
                      imageUrl: "assets/images/tips2.png",
                      updatedAt: "11 Dec",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80 + edge),
            //NOTE : BOTTOM NAVIGATION BAR
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/images/Icon_home.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/Icon_mail.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/Icon_card.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_love.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
