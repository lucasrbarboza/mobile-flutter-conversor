import  'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();

  void _resetFields(){
    celsiusController.text = "";
    fahrenheitController.text = "";
  }

  void _converter(){
    double celsius;
    double fahrenheit;
    double result;
    if(celsiusController.text.length == 0){
      celsius = double.parse(celsiusController.text);
      result = celsius * 1.8 + 32.0;
      fahrenheitController.text = result.toStringAsFixed(4);
    }
    if(fahrenheitController.text.length == 0){
      fahrenheit = double.parse(fahrenheitController.text);
      result = fahrenheit / 1.8 - 32.0;
      celsiusController.text = result.toStringAsFixed(4);
    }
    if(celsiusController.text.length > 0 && fahrenheitController.text.length > 0){
      fahrenheitController.text = "";
      celsiusController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (){ _resetFields(); },
        )
      ],
    );
    Icon icon = Icon(Icons.wb_sunny, size: 120, color: Colors.yellow);
    Container spacer = Container(height: 30);
    TextStyle styleDecoration = TextStyle(color: Colors.blueAccent, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.indigo);
    TextField tempCelsius = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Temperatura em Celsius (ºC):", labelStyle: styleDecoration),
      textAlign: TextAlign.center,
      style: styleField,
      controller: celsiusController,
    );
    TextField tempFahrenheit = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Temperatura em Fahrenheit (ºF):", labelStyle: styleDecoration),
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
    );
    RaisedButton raisedButton = RaisedButton(onPressed: (){ _converter(); }, child: Text("Calcular"), color: Colors.blueAccent);
    Container containerBtn = Container(height: 50, child: raisedButton);
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        icon,
        spacer,
        tempCelsius,
        spacer,
        tempFahrenheit,
        spacer,
        containerBtn
      ],
    );
    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: column,
      padding: EdgeInsets.all(34),
    );
    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );
    return scaffold;
  }
}