

import 'package:spdycustomers/Model/mapData/nearby_available_drivers.dart';

class GeoFireAssistants{
  static List<NearbyAvailableDrivers> nearbyAvailableDriversList = [];

  static void removeDriverFromList(String key){
    int index=nearbyAvailableDriversList.indexWhere((element) => element.key==key);
    // ignore: list_remove_unrelated_type
    nearbyAvailableDriversList.remove(index);
  }
  static void updateDriverNearbyLocation(NearbyAvailableDrivers driver){
    int index=nearbyAvailableDriversList.indexWhere((element) => element.key==driver.key);
    nearbyAvailableDriversList[index].longitude=driver.longitude;
    nearbyAvailableDriversList[index].latitude=driver.latitude;
  }
}