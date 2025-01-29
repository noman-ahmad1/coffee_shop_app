import 'package:hive/hive.dart';

part 'coffee_model.g.dart';

@HiveType(typeId: 201) // Unique ID for this model
class CoffeeFlavor {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String imageAsset;

  @HiveField(3)
  final String price;

  @HiveField(4)
  int quantity;

  CoffeeFlavor({
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.price,
    required this.quantity,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CoffeeFlavor) return false;
    return name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}
