import 'package:hive/hive.dart';

part 'coffee_model.g.dart';

@HiveType(typeId: 201) // Unique ID for Hive storage
class CoffeeFlavor {
  @HiveField(0)
  final String id; // Firestore Document ID

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imageAsset;

  @HiveField(4)
  final String price;

  @HiveField(5)
  int quantity;

  CoffeeFlavor({
    required this.id,
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.price,
    required this.quantity,
  });

  // Convert CoffeeFlavor to a Map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageAsset': imageAsset,
      'price': price,
      'quantity': quantity,
    };
  }

  // Create CoffeeFlavor from Firestore document snapshot
  factory CoffeeFlavor.fromJson(Map<String, dynamic> json, String documentId) {
    return CoffeeFlavor(
      id: documentId, // Use Firestore document ID
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageAsset: json['imageAsset'] ?? '',
      price: json['price'] ?? '',
      quantity: json['quantity'] ?? 1,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CoffeeFlavor) return false;
    return id == other.id; // Use Firestore ID for equality check
  }

  @override
  int get hashCode => id.hashCode;
}
