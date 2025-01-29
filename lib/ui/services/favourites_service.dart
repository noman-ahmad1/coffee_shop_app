import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:stacked/stacked.dart';

class FavouritesService with ListenableServiceMixin {
  List<CoffeeFlavor> favourites = [];
  late final Box favouritesBox;

  FavouritesService() {
    _initializeFavourites();
  }

  Future<void> _initializeFavourites() async {
    if (!Hive.isBoxOpen('favourites')) {
      await Hive.openBox('favourites');
    }
    favouritesBox = Hive.box('favourites');

    // Load saved favourites from Hive
    favourites = List<CoffeeFlavor>.from(
        favouritesBox.get('favouritesList') ?? []);
    notifyListeners();
  }

  void addToFavourites(CoffeeFlavor item) {
    if (!favourites.any((fav) => fav.name == item.name)) {
      favourites.add(item);

      // Save updated list to Hive
      favouritesBox.put('favouritesList', favourites);
      notifyListeners();
    }
  }

  void removeFromFavourites(CoffeeFlavor item) {
    favourites.removeWhere((fav) => fav.name == item.name);

    // Save updated list to Hive
    favouritesBox.put('favouritesList', favourites);
    notifyListeners();
  }

  bool isFavourite(CoffeeFlavor item) {
    return favourites.any((fav) => fav.name == item.name);
  }
}
