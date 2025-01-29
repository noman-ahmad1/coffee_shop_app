import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_first_app/app/app.bottomsheets.dart';
import 'package:my_first_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/app_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kcBackgroundColor2,
        body: Stack(children: [
          GoogleMap(
              onMapCreated: viewModel.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: viewModel.center,
                zoom: 11.0,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 60),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: screenSize.height * 0.056,
                    width: screenSize.width * 0.125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kcVeryLightGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        color: kcBlackColor,
                        // height: screenSize.height * 0.035,
                        // width: screenSize.width * 0.065,
                        myIcons.back,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.65,
                ),
                Container(
                  height: screenSize.height * 0.056,
                  width: screenSize.width * 0.125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kcVeryLightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      color: kcBlackColor,
                      // height: screenSize.height * 0.035,
                      // width: screenSize.width * 0.065,
                      myIcons.gps,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: NoticeSheet(
              completer: (SheetResponse response) {
                if (response.confirmed) {
                  print('User confirmed the sheet');
                } else {
                  print('User dismissed the sheet');
                }
              },
              request: viewModel.sheetRequest,
            ),
          ),
        ]));
  }

  @override
  MapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MapViewModel();
}
