// // food_item_model.dart
// class FoodItem {
//   final int id;
//   final String name;
//   final String description;
//   final String image;
//   final double price;
//   final bool veg;

//   FoodItem({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.price,
//     required this.veg,
//   });

//   factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
//         id: json['id'],
//         name: json['name'],
//         description: json['description'],
//         image: json['image'],
//         price: json['price'].toDouble(),
//         veg: json['veg'],
//       );
// }

// class MenuSection {
//   final int popmenuId;
//   final String postarimg;
//   final String menuUpdatedDate;
//   final List<FoodItem> items;

//   MenuSection({
//     required this.popmenuId,
//     required this.postarimg,
//     required this.menuUpdatedDate,
//     required this.items,
//   });

//   factory MenuSection.fromJson(Map<String, dynamic> json) => MenuSection(
//         popmenuId: json['popmenuId'],
//         postarimg: json['postarimg'],
//         menuUpdatedDate: json['menuUpdatedDate'],
//         items: List<FoodItem>.from(
//           json['items'].map((x) => FoodItem.fromJson(x)),
//         ),
//       );
// }

class FoodItem {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final bool veg;
  int quantity;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.veg,
    this.quantity = 0,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    image: json['image'],
    price: (json['price'] as num).toDouble(),
    veg: json['veg'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image,
    'price': price,
    'veg': veg,
    'quantity': quantity,
  };

  FoodItem copyWith({int? quantity}) => FoodItem(
    id: id,
    name: name,
    description: description,
    image: image,
    price: price,
    veg: veg,
    quantity: quantity ?? this.quantity,
  );
}

class MenuSection {
  final int popmenuId;
  final String posterImg;
  final String menuUpdatedDate;
  final List<FoodItem> items;

  MenuSection({
    required this.popmenuId,
    required this.posterImg,
    required this.menuUpdatedDate,
    required this.items,
  });

  factory MenuSection.fromJson(Map<String, dynamic> json) => MenuSection(
    popmenuId: json['popmenuId'],
    posterImg: json['postarimg'],
    menuUpdatedDate: json['menuUpdatedDate'],
    items: List<FoodItem>.from(
      (json['items'] as List).map((x) => FoodItem.fromJson(x)),
    ),
  );
}
