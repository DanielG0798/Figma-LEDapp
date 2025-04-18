import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class LEDColorPicker extends StatefulWidget {
  const LEDColorPicker({super.key});

  @override
  LEDColorPickerState createState() => LEDColorPickerState();
}

class LEDColorPickerState extends State<LEDColorPicker> {
  Color pickerColor = Color.fromARGB(255, 255, 255, 255);
  Color currentColor = Color.fromARGB(255, 255, 255, 255);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                // ToDo: Send the selected color to the LED controller here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LED Color Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Color", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              width: 100,
              height: 100,
              color: currentColor,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showColorPicker,
              child: Text("Pick a Color"),
            ),
          ],
        ),
      ),
    );
  }
}
