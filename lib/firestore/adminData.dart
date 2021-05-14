import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honeyroom/openAPI/Users.dart';
import 'dart:math';
import 'landCord.dart';
import 'map.dart';

// True, false 랜덤
bool random() {
  Random random = Random();
  bool rand = random.nextBool();
  return rand;
}

//방 개수 1~4
int random2(double x) {
  if (x < 30) // 10평미만
    return 1;
  else if (x >= 30 && x < 83) // 25평 미만
    return 2;
  else if (x >= 83 && x <= 130) // 25~39평
    return 3;
  else // 39평 ~
    return 4;
}

// 화장실 개수 1~2
int random3(double x) {
  if (x < 83) // 25평 미만
    return 1;
  else if (x >= 83 && x <= 194) // 25~58평
    return 2;
  else // 58평 ~
    return 3;
}

// 전월세 다가구
void addRentData(
  String constructionYear,
  String year,
  String address,
  String month,
  String date,
  String squareMeasure,
  String code,
  String guranteedAmount,
  String monthlyRent,
) async {
  bool parking = random();
  bool pet = random();
  bool elevator = random();
  bool cctv = random();
  bool doorSecurity = random();
  bool guard = random();
  bool intercom = random();
  bool airConditioner = random();
  bool refrigerator = random();
  bool bed = random();
  bool washer = random();
  bool dishwasher = random();
  bool dryer = random();
  bool closet = random();
  bool shoeRack = random();
  bool microwave = random();
  bool multipleLayer = random();
  int rooms = random2(double.parse(squareMeasure));
  int bathroom = random3(double.parse(squareMeasure));

  FirebaseFirestore addData = FirebaseFirestore.instance;
  // collection 이름은 상황에 맞춰 바꿔야함 -> 필터기능 구현할 때 컬렉션에 들어가는 이름은 자동으로 설정되도록 변경할 필요 있음.
  var type;
  if (int.parse(monthlyRent) == 0)
    type = '전세';
  else
    type = '월세';

  //addData.collection("다가구").doc().collection("서울");

  addData
      .collection('다가구test')
      .doc("1")
      .collection(type)
      .doc("1")
      .collection('서울')
      .doc("1")
      .collection(landcodeToSeoul[code])
      .doc("1")
      .collection(address)
      .add({
    '건축년도': constructionYear,
    '년': year,
    '법정동': address,
    '월': month,
    '일': date,
    '전용면적': squareMeasure,
    '지역코드': code,
    '보증금액': guranteedAmount,
    '월세금액': monthlyRent,
    '주차': parking,
    '반려견': pet,
    '엘리베이터': elevator,
    'CCTV': cctv,
    '현관보안': doorSecurity,
    '경비원': guard,
    '인터폰': intercom,
    '에어컨': airConditioner,
    '냉장고': refrigerator,
    '침대': bed,
    '세탁기': washer,
    '식기세척기': dishwasher,
    '건조기': dryer,
    '옷장': closet,
    '신발장': shoeRack,
    '전자레인지': microwave,
    '복층': multipleLayer,
    '방개수': rooms,
    '화장실개수': bathroom,
  });
}

// 데이터를 firebase에 추가하는 부분 apart
addAprtbuyData(
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
    String floor) async {
  bool parking = random();
  bool pet = random();
  bool elevator = random();
  bool cctv = random();
  bool doorSecurity = random();
  bool guard = random();
  bool intercom = random();
  bool airConditioner = random();
  bool refrigerator = random();
  bool bed = random();
  bool washer = random();
  bool dishwasher = random();
  bool dryer = random();
  bool closet = random();
  bool shoeRack = random();
  bool microwave = random();
  bool multipleLayer = random();
  int rooms = random2(double.parse(squareMeasure));
  int bathroom = random3(double.parse(squareMeasure));
  List points = await pointSearch(address, number);

  FirebaseFirestore addData = FirebaseFirestore.instance;
  // collection 이름은 상황에 맞춰 바꿔야함 -> 필터기능 구현할 때 컬렉션에 들어가는 이름은 자동으로 설정되도록 변경할 필요 있음.
  addData.collection('아파트').doc('매매').collection('서울').add({
    '거래금액': transactionAmount,
    '건축년도': constructionYear,
    '년': year,
    '법정동': address,
    '아파트': apartment,
    '월': month,
    '일': date,
    '전용면적': squareMeasure,
    '지번': number,
    '지역코드': code,
    '층': floor,
    '주차': parking,
    '반려견': pet,
    '엘리베이터': elevator,
    'CCTV': cctv,
    '현관보안': doorSecurity,
    '경비원': guard,
    '인터폰': intercom,
    '에어컨': airConditioner,
    '냉장고': refrigerator,
    '침대': bed,
    '세탁기': washer,
    '식기세척기': dishwasher,
    '건조기': dryer,
    '옷장': closet,
    '신발장': shoeRack,
    '전자레인지': microwave,
    '복층': multipleLayer,
    '방개수': rooms,
    '화장실개수': bathroom,
    '위도': points[0],
    '경도': points[1]
  });
}

// firebase의 데이터를 읽어오는 부분
/* 
  building : 아파트, 다가구, 오피스텔
  type : 매매, 전세, 월세
  city : 시
*/

List check(bool filter) {
  if (filter = true)
    return [true];
  else
    return [true, false];
}

// String transactionAmount,
// String constructionYear,
// String year,
// String address,
// String apartment,
// String month,
// String date,
// String squareMeasure,
// String number,
// String code,
// String floor,
// String guranteedAmount,
// String monthlyRent,
// bool parking,
// bool pet,
// bool elevator,
// bool cctv,
// bool doorSecurity,
// bool guard,
// bool intercom,
// bool airConditioner,
// bool refrigerator,
// bool bed,
// bool washer,
// bool dishwasher,
// bool dryer,
// bool closet,
// bool shoeRack,
// bool microwave,
// bool multipleLayer,
// int rooms,
// int bathroom

class ReadData {
  static Future readData(String building, String type, String city) async {
    List _users = [];
    String _transactionAmount;
    String _constructionYear;
    String _year;
    String _address;
    String _apartment;
    String _month;
    String _date;
    String _squareMeasure;
    String _number;
    String _code;
    String _floor;
    String guranteedAmount;
    String monthlyRent;

    // List _parking = check(parking);
    // List _pet = check(pet);
    // List _elevator = check(elevator);
    // List _cctv = check(cctv);
    // List _doorSecurity = check(doorSecurity);
    // List _guard = check(guard);
    // List _intercom = check(intercom);
    // List _airConditioner = check(airConditioner);
    // List _refrigerator = check(refrigerator);
    // List _bed = check(bed);
    // List _washer = check(washer);
    // List _dishwasher = check(dishwasher);
    // List _dryer = check(dryer);
    // List _closet = check(closet);
    // List _shoeRack = check(shoeRack);
    // List _microwave = check(microwave);
    // List _multipleLayer = check(multipleLayer);
    // int _rooms = rooms;
    // int _bathroom = bathroom;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(building)
        .doc(type)
        .collection(city)
        //.where("주차", whereIn: _parking)
        //.where("반려견", whereIn: [false, true])
        // .where("엘리베이터", whereIn: _elevator)
        // .where("CCTV", whereIn: _cctv)
        // .where("현관보안", whereIn: _doorSecurity)
        // .where("경비원", whereIn: _guard)
        // .where("인터폰", whereIn: _intercom)
        // .where("에어컨", whereIn: _airConditioner)
        // .where("냉장고", whereIn: _refrigerator)
        // .where("침대", whereIn: _bed)
        // .where("세탁기", whereIn: _washer)
        // .where("식기세척기", whereIn: _dishwasher)
        // .where("건조기", whereIn: _dryer)
        // .where("옷장", whereIn: _closet)
        // .where("신발장", whereIn: _shoeRack)
        // .where("전자레인지", whereIn: _microwave)
        // .where("복층", whereIn: _multipleLayer)
        // .where("방개수", isGreaterThanOrEqualTo: _rooms)
        // .where("화장실개수", isGreaterThanOrEqualTo: _bathroom)
        .get();

    for (int i = 0; i < querySnapshot.size; i++) {
      _users.add(querySnapshot.docs[i].data());
    }
    print(_users.length);
    final List<Read> users = usersFromFirebase(_users);
    return users;
  }
}
