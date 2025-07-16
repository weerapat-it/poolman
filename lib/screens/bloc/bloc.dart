import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';
class ProviderMaps with ChangeNotifier{
 LatLng _gpsactual;
 LatLng _initialposition=LatLng(-12.122711,-77.027475);
 bool activegps=true;
 TextEditingController locationController = TextEditingController();
 GoogleMapController _mapController;
LatLng get gpsPosition => _gpsactual;
LatLng get initialPos =>_initialposition;
final Set<Marker> _markers=Set();
Set<Marker> get markers => _markers;
GoogleMapController get mapController => _mapController;

 getMoveCamera()async{

  List<Placemark> placemark = await placemarkFromCoordinates(_initialposition.latitude, _initialposition.longitude);
   locationController.text = placemark[0].name +" "+placemark[0].locality +" "+placemark[0].thoroughfare +" "+placemark[0].postalCode +" "+placemark[0].country ;
  print("initial position is : ${placemark[0].name} ${placemark[0].locality} ${placemark[0].thoroughfare} ${placemark[0].postalCode} ${placemark[0].country}");
  print("the latitude is: ${_initialposition.latitude} and th longitude is: ${_initialposition.longitude} ");
  return placemark[0].name +" "+placemark[0].locality +" "+placemark[0].thoroughfare +" "+placemark[0].postalCode +" "+placemark[0].country;
}

void getUserLocation() async {
  if (!(await Geolocator.isLocationServiceEnabled()))
    {     
    activegps=false;     
    }else{
  activegps=true;               
    Position position = await Geolocator
     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    _initialposition = LatLng(position.latitude, position.longitude);
    print("the latitude is: ${position.longitude} and th longitude is: ${position.longitude} ");
  locationController.text = placemark[0].name +" "+placemark[0].locality +" "+placemark[0].thoroughfare +" "+placemark[0].postalCode +" "+placemark[0].country ;
    _addMarker(_initialposition,placemark[0].name);
   _mapController.moveCamera(CameraUpdate.newLatLng(_initialposition));    
    print("initial position is : ${placemark[0].name} ${placemark[0].locality} ${placemark[0].thoroughfare} ${placemark[0].postalCode} ${placemark[0].country}");
    notifyListeners();
  }
   }      
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void _addMarker(LatLng location, String address) {
        _markers.add(Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: InfoWindow(title: address, snippet: "go here"),
        icon: BitmapDescriptor.defaultMarker));
    notifyListeners();
  }

  void onCameraMove(CameraPosition position)async {
    _initialposition = position.target;
    notifyListeners();
  }

}