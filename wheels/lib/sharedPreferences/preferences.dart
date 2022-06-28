import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wheels/models/groupModel.dart';

class PreferencesService {
  void changeGroupSubscription(String groupId) async {
    final preferences = await SharedPreferences.getInstance();
    var current = preferences.getBool(groupId);

    if (current == false) {
      preferences.setBool(groupId, true);
    } else {
      preferences.setBool(groupId, false);
    }
    //await preferences.setStringList(key, value);
  }

  dynamic getSubsciptionStatus(String groupId) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(groupId) == null) {
      await preferences.setBool(groupId, false);
      return false;
    } else {
      var result = await preferences.getBool(groupId);
      return result;
    }
  }

  void addTripInfo(
      String name,
      String price,
      bool originUniandes,
      String destinationOrigin,
      String ruta1,
      String ruta2,
      String ruta3,
      String grupo,
      String whatsapp) async {
    final preferences = await SharedPreferences.getInstance();
    dynamic storedTrips = preferences.getStringList("pruebaRutas");

    if (storedTrips == null) {
      List<String> tripMap = [
        '{"Nombre":"${name.toString()}","Precio":"${price.toString()}","destinationOrigin":"$destinationOrigin","OrigenUniandes":"${originUniandes.toString()}","Lugar1":"$ruta1","Lugar2":"$ruta2","Lugar3":"$ruta3","Grupo":"$grupo","Numero Whatsapp":"$whatsapp"}'
      ];
      preferences.setStringList("pruebaRutas", tripMap);
    } else {
      String tripMap =
          '{"Nombre":"${name.toString()}","Precio":"${price.toString()}","destinationOrigin":"$destinationOrigin","OrigenUniandes":"${originUniandes.toString()}","Lugar1":"$ruta1","Lugar2":"$ruta2","Lugar3":"$ruta3","Grupo":"$grupo","Numero Whatsapp":"$whatsapp"}';
      storedTrips.add(tripMap);
      preferences.setStringList("pruebaRutas", storedTrips);
    }
  }

  void deleteTrip(String delete) async {
    final preferences = await SharedPreferences.getInstance();
    var trips = preferences.getStringList("pruebaRutas");
    trips!.remove(delete);
    preferences.setStringList("pruebaRutas", trips);
  }

  Future getTripInfo() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList("pruebaRutas");
  }
}
