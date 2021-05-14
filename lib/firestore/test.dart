import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honeyroom/openAPI/Users.dart';

class ReadData {
  static Future readData(
    String building,
    String type,
    String city,
  ) async {
    List _users = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(building)
        .doc(type)
        .collection(city)
        .get();

    for (int i = 0; i < querySnapshot.size; i++) {
      _users.add(querySnapshot.docs[i].data());
    }
    return _users;
  }

  static filter(
      List user,
      String transactionAmount,
      String constructionYear,
      String year,
      String address,
      String apartment,
      String month,
      String date,
      String squareMeasure,
      String number,
      String code,
      String floor,
      String guranteedAmount,
      String monthlyRent,
      bool parking,
      bool pet,
      bool elevator,
      bool cctv,
      bool doorSecurity,
      bool guard,
      bool intercom,
      bool airConditioner,
      bool refrigerator,
      bool bed,
      bool washer,
      bool dishwasher,
      bool dryer,
      bool closet,
      bool shoeRack,
      bool microwave,
      bool multipleLayer,
      int rooms,
      int bathroom) {
    // var _user = user
    //     .where((element) => pet == true ? element.pet == true : element)
    //     .where((element) => parking == true ? element.parking == true : element)
    //     .where(
    //         (element) => elevator == true ? element.elevator == true : element)
    //     .where((element) => cctv == true ? element.cctv == true : element)
    //     .where((element) =>
    //         doorSecurity == true ? element.doorSecurity == true : element)
    //     .where((element) => guard == true ? element.guard == true : element)
    //     .where(
    //         (element) => intercom == true ? element.intercom == true : element)
    //     .where((element) =>
    //         airConditioner == true ? element.airConditioner == true : element)
    //     .where((element) =>
    //         refrigerator == true ? element.refrigerator == true : element)
    //     .where((element) => bed == true ? element.bed == true : element)
    //     .where((element) => washer == true ? element.washer == true : element)
    //     .where((element) =>
    //         dishwasher == true ? element.dishwasher == true : element)
    //     .where((element) => dryer == true ? element.dryer == true : element)
    //     .where((element) => closet == true ? element.closet == true : element)
    //     .where(
    //         (element) => shoeRack == true ? element.shoeRack == true : element)
    //     .where((element) =>
    //         microwave == true ? element.microwave == true : element)
    //     .where((element) =>
    //         multipleLayer == true ? element.multipleLayer == true : element)
    //     .where((element) => rooms != 0 ? element.rooms <= rooms : element)
    //     .where((element) =>
    //         bathroom != 0 ? element.bathroom <= bathroom : element);
    print(user);
    var _user = user
        .where((element) => pet == true ? element['pet'] == true : element)
        .where(
            (element) => parking == true ? element['parking'] == true : element)
        .where((element) =>
            elevator == true ? element['elevator'] == true : element)
        .where((element) => cctv == true ? element['cctv'] == true : element)
        .where((element) =>
            doorSecurity == true ? element['doorSecurity'] == true : element)
        .where((element) => guard == true ? element['guard'] == true : element)
        .where((element) =>
            intercom == true ? element['intercom'] == true : element)
        .where((element) => airConditioner == true
            ? element['airConditioner'] == true
            : element)
        .where((element) =>
            refrigerator == true ? element['refrigerator'] == true : element)
        .where((element) => bed == true ? element['bed'] == true : element)
        .where(
            (element) => washer == true ? element['washer'] == true : element)
        .where((element) =>
            dishwasher == true ? element['dishwasher'] == true : element)
        .where((element) => dryer == true ? element['dryer'] == true : element)
        .where(
            (element) => closet == true ? element['closet'] == true : element)
        .where((element) =>
            shoeRack == true ? element['shoeRack'] == true : element)
        .where((element) =>
            microwave == true ? element['microwave'] == true : element)
        .where((element) =>
            multipleLayer == true ? element['multipleLayer'] == true : element)
        .where((element) => rooms != 0 ? element['rooms'] <= rooms : element)
        .where((element) =>
            bathroom != 0 ? element['bathroom'] <= bathroom : element);
    if (_user.isNotEmpty) {
      return _user;
    } else
      return false;
  }
}
