import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import 'models/football_model.dart';

class FootballEditController extends GetxController {
  final FootballController footballController = Get.find();

  late int playerIndex;
  late FootballModel player;

  // Form fields
  var name = ''.obs;
  var position = ''.obs;
  var jerseyNumber = 0.obs;
  var profileImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    player = args['player'];
    playerIndex = args['index'];

    name.value = player.name;
    position.value = player.position;
    jerseyNumber.value = player.jerseyNumber;
    profileImage.value = player.profileImage;
  }

  void savePlayer() {
    footballController.players[playerIndex] = FootballModel(
      name: name.value,
      position: position.value,
      jerseyNumber: jerseyNumber.value,
      profileImage: profileImage.value,
    );
    Get.back();
  }
}
