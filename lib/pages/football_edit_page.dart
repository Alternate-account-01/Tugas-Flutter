import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_edit_controller.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballEditController controller = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => TextField(
                decoration: const InputDecoration(labelText: "Name"),
                controller: TextEditingController(text: controller.name.value)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.name.value.length),
                  ),
                onChanged: (val) => controller.name.value = val,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                decoration: const InputDecoration(labelText: "Position"),
                controller:
                    TextEditingController(text: controller.position.value)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: controller.position.value.length),
                      ),
                onChanged: (val) => controller.position.value = val,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                decoration: const InputDecoration(labelText: "Jersey Number"),
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(
                        text: controller.jerseyNumber.value.toString(),
                      )
                      ..selection = TextSelection.fromPosition(
                        TextPosition(
                          offset: controller.jerseyNumber.value
                              .toString()
                              .length,
                        ),
                      ),
                onChanged: (val) =>
                    controller.jerseyNumber.value = int.tryParse(val) ?? 0,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.savePlayer(),
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
