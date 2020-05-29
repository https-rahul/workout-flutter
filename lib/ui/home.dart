import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new bmiState();
  }
}

class bmiState extends State<Home> {
  final TextEditingController _kgController = new TextEditingController();
  final TextEditingController _feetController = new TextEditingController();
  String status = "";
  double bmi = 0.0;

  void bmiCalculate() {
    setState(() {
      final double _weight = double.parse(_kgController.text);
      final double _height = 0.3048 * double.parse(_feetController.text);

      bmi = _weight / (_height * _height);

      if (bmi > 0.0 && bmi < 16.0) {
        status = "Severely Underweight";
      } else if (bmi > 16.0 && bmi < 18.4) {
        status = "Underweight";
      } else if (bmi > 18.5 && bmi < 24.9) {
        status = "Normal";
      } else if (bmi > 25.0 && bmi < 29.9) {
        status = "Overweight";
      } else if (bmi > 30.0 && bmi < 34.9) {
        status = "Moderately Obese";
      } else if (bmi > 35.0 && bmi < 39.9) {
        status = "Severely Obese";
      } else if (bmi > 40.0 && bmi < 100.0) {
        status = "Morbidly Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fitness"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.center,
        child: new Container(
          margin: const EdgeInsets.all(15.0),
          alignment: Alignment.center,
          child: new ListView(
            children: <Widget>[
              new TextField(
                controller: _kgController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: new InputDecoration(
                  labelText: 'Enter you weight',
                  hintText: 'in kgs',
                  icon: new Icon(Icons.av_timer),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              new TextField(
                controller: _feetController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: new InputDecoration(
                  labelText: 'Enter you height',
                  hintText: 'in feet.inches',
                  icon: new Icon(Icons.format_line_spacing),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.all(16.5)),
              new Container(
                alignment: Alignment.center,
                child: new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: bmiCalculate,
                  color: Colors.purpleAccent,
                  child: new Text('Calculate BMI'),
                  textColor: Colors.white,
                ),
              ),
              new Padding(padding: EdgeInsets.all(16.5)),
              new Container(
                alignment: Alignment.center,
                child: new Text(
                  _kgController.text.isEmpty
                      ? "Hello, there!"
                      : "${bmi.toStringAsFixed(1)} $status",
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
