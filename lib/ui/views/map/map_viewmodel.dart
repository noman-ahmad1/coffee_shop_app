import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MapViewModel extends BaseViewModel {
  GoogleMapController? mapController;

  final LatLng center = const LatLng(37.7749, -122.4194);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    notifyListeners();
  }

  final sheetRequest = SheetRequest(
    title: '10 minutes left',
    description: 'Farhan Ali',
  );
}
