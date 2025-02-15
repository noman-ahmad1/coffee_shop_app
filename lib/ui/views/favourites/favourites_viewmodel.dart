import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/ui/models.dart/coffee_model.dart';
import 'package:my_first_app/ui/services/favourites_service.dart';
import 'package:my_first_app/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FavouritesViewModel extends DashboardViewModel {
  final FavouritesService _favouritesService = locator<FavouritesService>();

  // Get the list of favourites
  List<CoffeeFlavor> get favourites => _favouritesService.favourites;

  // Remove item from favourites
  void removeFromFavourites(CoffeeFlavor coffee) {
    _favouritesService.removeFromFavourites(coffee);
    notifyListeners(); // Notify UI to rebuild
  }

  bool isFavourite(CoffeeFlavor coffeeList) {
    return _favouritesService.isFavourite(coffeeList);
  }
}
