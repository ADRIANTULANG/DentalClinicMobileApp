import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../services/location_services.dart';
import '../../client_home_screen/model/client_home_model.dart';

class CliniGoogleMapsDetailsController extends GetxController {
  RxList<Marker> markers = <Marker>[].obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxBool isLoading = true.obs;

  RxBool isShownClinicDetails = true.obs;

  Rx<LatLng> centerOfTwoLocation = LatLng(0.0, 0.0).obs;

  ClientHomeModel? clientHomeModel;
  @override
  void onInit() async {
    clientHomeModel = await Get.arguments['clientHomeModel'];
    print(clientHomeModel!.clinicAddress);
    print(clientHomeModel!.clinicContactNo);
    print(clientHomeModel!.clinicLat);
    print(clientHomeModel!.clinicLong);
    print(clientHomeModel!.clinicDentistName);
    await addMarker(
        lat: clientHomeModel!.clinicLat,
        long: clientHomeModel!.clinicLong,
        markerID: clientHomeModel!.clinicId,
        cliniName: clientHomeModel!.clinicName,
        distance: double.parse(clientHomeModel!.distance).toStringAsFixed(2) +
            " Kilometers away from your location");

    addMarker(
        lat: Get.find<LocationServices>().user_latitude.toString(),
        long: Get.find<LocationServices>().user_longitude.toString(),
        markerID: "MyLocation",
        cliniName: "Your current location",
        distance: "");
    await isLoading(false);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCenter({
    required LatLng currentLatlng,
    required LatLng clinicLatlng,
  }) {
    LatLngBounds bounds =
        LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    if (clinicLatlng.latitude > currentLatlng.latitude &&
        clinicLatlng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(southwest: currentLatlng, northeast: clinicLatlng);
    } else if (clinicLatlng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(clinicLatlng.latitude, currentLatlng.longitude),
          northeast: LatLng(currentLatlng.latitude, clinicLatlng.longitude));
    } else if (clinicLatlng.latitude > currentLatlng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(currentLatlng.latitude, clinicLatlng.longitude),
          northeast: LatLng(clinicLatlng.latitude, currentLatlng.longitude));
    } else {
      bounds = LatLngBounds(southwest: clinicLatlng, northeast: currentLatlng);
    }

    double center_lat =
        (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    double center_long =
        (bounds.southwest.longitude + bounds.northeast.longitude) / 2;
    centerOfTwoLocation.value = LatLng(center_lat, center_long);

    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 20.w));
    print("age dre");
  }

  addMarker(
      {required String lat,
      required String long,
      required String markerID,
      required String cliniName,
      required String distance}) {
    markers.add(Marker(
        markerId: MarkerId(markerID),
        position: LatLng(double.parse(lat), double.parse(long)),
        infoWindow: InfoWindow(
          title: cliniName,
          snippet: distance,
        )));
  }

  Future<void> goToTheLocation(
      {required double lat, required double long}) async {
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(lat, long),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }

  Future<void> gotoMyLocation() async {
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(Get.find<LocationServices>().user_latitude,
                Get.find<LocationServices>().user_longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }
}
