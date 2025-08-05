import 'package:flutter/material.dart';
import 'package:flutter_the_second/widget/clear_button.dart';
import 'package:flutter_the_second/widget/operation_button.dart';
import 'package:flutter_the_second/widget/text_fields.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  void _clearFields() {
    _controller1.clear();
    _controller2.clear();
    _resultController.clear();
  }

  void _calculate(String operator) {
    final nomor1 = double.tryParse(_controller1.text);
    final nomor2 = double.tryParse(_controller2.text);

    if (nomor1 != null && nomor2 != null) {
      double hasil;

      switch (operator) {
        case '+':
          hasil = nomor1 + nomor2;
          break;
        case '-':
          hasil = nomor1 - nomor2;
          break;
        case '×':
          hasil = nomor1 * nomor2;
          break;
        case '÷':
          hasil = nomor1 / nomor2;
          break;
        default:
          return;
      }

      if (hasil % 1 == 0) {
        _resultController.text = hasil.toInt().toString();
      } else {
        _resultController.text = hasil.toStringAsFixed(2);
      }
    } else {
      _resultController.text = "Masukkan dulu angkanya, pls.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(controller: _controller1, label: 'Angka Pertama'),
            const SizedBox(height: 16),
            InputField(controller: _controller2, label: 'Angka Kedua'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OperationButton(label: '+', onPressed: () => _calculate('+')),
                OperationButton(label: '-', onPressed: () => _calculate('-')),
                OperationButton(label: '×', onPressed: () => _calculate('×')),
                OperationButton(label: '÷', onPressed: () => _calculate('÷')),
              ],
            ),
            const SizedBox(height: 20),
            ResultField(controller: _resultController),
            const SizedBox(height: 20),
            ClearButton(onPressed: _clearFields),
          ],
        ),
      ),
    );
  }
}
