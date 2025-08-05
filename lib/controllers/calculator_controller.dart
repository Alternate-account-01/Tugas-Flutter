import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController{
  final  firstNumberController = TextEditingController();
  final  secondNumberController = TextEditingController(); 
  var hasil = ''.obs;

  void add() {
    int firstNumber = int.parse(firstNumberController.text.toString());
    int secondNumber = int.parse(secondNumberController.text.toString());
    
    int result = firstNumber + secondNumber;
    hasil.value = (result).toString();
  }

  void subtract() {
    final int a = int.tryParse(firstNumberController.text) ?? 0;
    final int b = int.tryParse(secondNumberController.text) ?? 0;
    hasil.value = (a - b).toString();
  }

  void multiply() {
    final int a = int.tryParse(firstNumberController.text) ?? 0;
    final int b = int.tryParse(secondNumberController.text) ?? 0;
    hasil.value = (a * b).toString();
  }

  void divide() {
    final int a = int.tryParse(firstNumberController.text) ?? 0;
    final int b = int.tryParse(secondNumberController.text) ?? 1; // avoid divide-by-zero
    if (b == 0) {
      hasil.value = 'idiot';
    } else {
      hasil.value = (a / b).toStringAsFixed(2);
    }
  }

    void clear() {
    firstNumberController.clear();
    secondNumberController.clear();
    hasil.value = '';
  }

  @override
  void onClose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.onClose();
  }

}