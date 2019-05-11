import  'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (){},
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
    );
    TextField tempFahrenheit = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Temperatura em Fahrenheit (ºF):", labelStyle: styleDecoration),
      textAlign: TextAlign.center,
      style: styleField,
    );
    RaisedButton raisedButton = RaisedButton(onPressed: (){
    }, child: Text("Calcular"), color: Colors.blueAccent,);
    Container containerBtn = Container(height: 50, child: raisedButton);
    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        spacer,
        icon,
        spacer,
        tempCelsius,
        spacer,
        tempFahrenheit,
        spacer,
        containerBtn
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: column,
    );
    return scaffold;
  }
}