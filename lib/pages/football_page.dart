import 'package:flutter/material.dart';
import 'package:flutter_the_second/controllers/football_controller.dart';
import 'package:flutter_the_second/routes/routes.dart';
import 'package:get/get.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final FootballController controller = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Football Players")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.players.length,
            itemBuilder: (context, index) {
              final player = controller.players[index];
              return Container(
                margin: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Get.snackbar(
                        "Player Selected",
                        player.name,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.blueAccent,
                        colorText: Colors.white,
                      );

                      Get.toNamed(
                        AppRoutes.editfootballplayers,
                        arguments: {'player': player, 'index': index},
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(player.profileImage),
                    ),
                    title: Text(player.name),
                    subtitle: Text(
                      "${player.position} • #${player.jerseyNumber}",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
