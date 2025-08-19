import 'package:flutter/material.dart';
import 'package:flutter_the_second/routes/routes.dart';
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
      appBar: AppBar(
        title: const Text(
          'Simple Calculator',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input fields
            const Text(
              "Enter first number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            MyTextField(
              textEditingController: controller.firstNumberController,
              label: 'Number 1',
            ),
            const SizedBox(height: 20),

            const Text(
              "Enter second number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            MyTextField(
              textEditingController: controller.secondNumberController,
              label: 'Number 2',
            ),

            const SizedBox(height: 24),

            // Operator buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: '+', onPressed: controller.add),
                CustomButton(text: '-', onPressed: controller.subtract),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: '×', onPressed: controller.multiply),
                CustomButton(text: '÷', onPressed: controller.divide),
              ],
            ),

            const SizedBox(height: 30),

            // Result
            const Text(
              'Result',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                controller.hasil.value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

           
            
          ],
        ),
      ),
    );
  }
}
