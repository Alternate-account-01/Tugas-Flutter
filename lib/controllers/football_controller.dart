import 'package:get/get.dart';
import 'models/football_model.dart';

class FootballController extends GetxController {
  var players = <FootballModel>[
    FootballModel(
      profileImage: "assets/chitos.png",
      name: 'Brock Purdy',
      position: 'Quarterback',
      jerseyNumber: 10,
    ),
    FootballModel(
      profileImage: "assets/chitos.png",
      name: 'Joe Burrow',
      position: 'Quarterback',
      jerseyNumber: 7,
    ),
    FootballModel(
      profileImage: "assets/chitos.png",
      name: 'Patrick Mahomes',
      position: 'Quarterback',
      jerseyNumber: 11,
    ),
  ].obs;
}
