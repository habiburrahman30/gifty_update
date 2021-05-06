import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CurrentLocationController extends GetxController {
  // location
  final cLatitude = 0.0.obs;
  final cLongitude = 0.0.obs;
  final locationOnOf = false.obs;
  final locationOnOfNumber = 0.obs;

  manageLocationOnOf() {
    locationOnOf.toggle();
  }

  //  var locationMessage = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final lastPosition = await Geolocator.getLastKnownPosition();
    var latitude = lastPosition?.latitude;
    var longitude = lastPosition?.longitude;

    cLatitude.value = latitude;
    cLongitude.value = longitude;

    print(position);
    print(cLatitude.value);
    print(cLongitude.value);

    // setState(() {
    //   locationMessage = "$position.latitude, $position.longitude";
    // });
  }
}
