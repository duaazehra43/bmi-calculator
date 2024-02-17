import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BMICalculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 160;
  double _weight = 60;
  double _bmi = 0;
  int _age = 25;
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        foregroundColor: Colors.white, // Custom app bar color
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _gender = Gender.male;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 50,
                            color: _gender == Gender.male
                                ? Colors.purple[900]
                                : Colors.grey,
                          ),
                          Text('Male', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _gender = Gender.female;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 50,
                            color: _gender == Gender.female
                                ? Colors.purple[900]
                                : Colors.grey,
                          ),
                          Text('Female', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 8, // Increased elevation for a shadow effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Rounded corners for the card
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900], // Custom text color
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Colors.purple[900],
                              onPressed: () {
                                setState(() {
                                  if (_age > 1) _age--;
                                });
                              },
                            ),
                            Text(
                              _age.toString(),
                              style: TextStyle(fontSize: 28),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.purple[900],
                              onPressed: () {
                                setState(() {
                                  if (_age < 100) _age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Height (cm)',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900],
                          ),
                        ),
                        SizedBox(height: 10),
                        Slider(
                          value: _height,
                          min: 100,
                          max: 220,
                          onChanged: (value) {
                            setState(() {
                              _height = value;
                            });
                          },
                          activeColor: Colors.purple[900],
                        ),
                        Text(
                          _height.toStringAsFixed(1),
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weight (kg)',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900],
                          ),
                        ),
                        SizedBox(height: 10),
                        Slider(
                          value: _weight,
                          min: 40,
                          max: 150,
                          onChanged: (value) {
                            setState(() {
                              _weight = value;
                            });
                          },
                          activeColor: Colors.purple[900],
                        ),
                        Text(
                          _weight.toStringAsFixed(1),
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[900], // Custom button color
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      _bmi = _weight / ((_height / 100) * (_height / 100));
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('BMI Result'),
                          content: Text(
                            'Your BMI is ${_bmi.toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Calculate BMI'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
