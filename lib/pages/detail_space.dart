import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facilities_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSpace extends StatelessWidget {
  final Space space;
  DetailSpace(this.space);

  @override
  Widget build(BuildContext context) {
    launchMyUrl(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorPage()),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),

            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      //NOTE : TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [1, 2, 3, 4, 5]
                                  .map(
                                    (index) => Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: RatingItem(
                                        index: index,
                                        rating: space.rating,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      //NOTE: MAIN FACILITIES
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Main Facilities",
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FacilitiesItem(
                                  imageUrl: 'assets/images/icon_kitchen.png',
                                  qty: '${space.numberOfKitchens} ',
                                  name: 'kitchen',
                                ),
                                FacilitiesItem(
                                  imageUrl: 'assets/images/icon_bedroom.png',
                                  qty: '${space.numberOfBedrooms} ',
                                  name: 'bedroom',
                                ),
                                FacilitiesItem(
                                  imageUrl: 'assets/images/icon_cupboard.png',
                                  qty: '${space.numberOfCupboards} ',
                                  name: 'Big Lemari',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //NOTE : PHOTO
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: edge,
                            ),
                            child: Text(
                              "Photos",
                              style: blackTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            height: 88,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...(space.photos ?? []).map((item) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 24),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        item,
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                width: 110,
                                                height: 88,
                                                color: Colors.grey,
                                                child: Icon(Icons.error),
                                              );
                                            },
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          // NOTE : LOCATION
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: edge,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location",
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "${space.address}\n${space.country}",
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    launchMyUrl(space.mapUrl);
                                  },
                                  child: Image.asset(
                                    'assets/images/btn_location.png',
                                    width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: edge),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    17,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                launchMyUrl("${space.phone}");
                              },
                              child: Text(
                                "Book Now",
                                style: whiteTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //NOTE : BUTTON BACK AND WISHLIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/images/btn_back.png', width: 40),
                  ),
                  Image.asset('assets/images/btn_wishlist.png', width: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
