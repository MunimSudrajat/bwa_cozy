class Space {
  int id = 0;
  String name = "name";
  String imageUrl = "imageUrl";
  int price = 0;
  String city = "city";
  String country = "country";
  int rating  = 0;
  String address = "address";
  String phone = "03210321";
  String mapUrl = "mapUrl";
  List photos = [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0 ;

  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
    required this.numberOfKitchens,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    city = json['city'];
    price = json['price'];
    rating = json['rating'];
    phone = json['phone'];
    photos = json['photos'];
    imageUrl = json['image_url'];
    mapUrl = json['map_url'];
    address = json['address'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
