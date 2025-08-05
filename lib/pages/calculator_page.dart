import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_the_second/widget/widget_button.dart';
import 'package:flutter_the_second/widget/widge_TextField.dart';
import 'package:flutter_the_second/controllers/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextField(
              textEditingController: controller.firstNumberController,
              label: 'angka 1',
            ),
            const SizedBox(height: 10),
            MyTextField(
              textEditingController: controller.secondNumberController,
              label: 'angka 2',
            ),
            const SizedBox(height: 20),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(text: '+', onPressed: controller.add),
                    CustomButton(text: '-', onPressed: controller.subtract),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(text: 'x', onPressed: controller.multiply),
                    CustomButton(text: '/', onPressed: controller.divide),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text('Hasil'),
            Obx(() => Text(
                  controller.hasil.value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            CustomButton(text: 'Clear', onPressed: controller.clear),
          ],
        ),
      ),
    );
  }
}
