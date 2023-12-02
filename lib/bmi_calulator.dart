import 'package:bmi_calculator/bmi_image.dart';
import 'package:flutter/material.dart';

class BmiCalulator extends StatefulWidget {
  const BmiCalulator({super.key});

  @override
  State<BmiCalulator> createState() => _BmiCalulatorState();
}

class _BmiCalulatorState extends State<BmiCalulator> {
  double _weightValue = 0.0;
  double _heightValue = 0.0;
  double result = 0.0;

  void calculateBMI() {
    if (_weightValue != 0.0 && _heightValue != 0.0) {
      result = _weightValue / (_heightValue * _heightValue);
    }
    if (_weightValue == 0.0 || _heightValue == 0.0) {
      result = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateBMI();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: result < 18.5
                    ? const BmiContainer(
                        bmiTitle: "UNDERWEIGHT",
                        bmiColor: Colors.blue,
                        bmiImage: AssetImage(
                            "assets/underweight.png"), // Pass AssetImage,
                      )
                    : result >= 18.5 && result < 25
                        ? const BmiContainer(
                            bmiTitle: "NOMRAL",
                            bmiColor: Colors.green,
                            bmiImage: AssetImage(
                                "assets/normal.png"), // Pass AssetImage,
                          )
                        : result >= 25 && result < 30
                            ? const BmiContainer(
                                bmiTitle: "OVERWEIGHT",
                                bmiColor: Color.fromARGB(255, 175, 164, 68),
                                bmiImage: AssetImage(
                                    "assets/overweight.png"), // Pass AssetImage,
                              )
                            : result >= 30 && result < 40
                                ? const BmiContainer(
                                    bmiTitle: "OBESITY",
                                    bmiColor: Colors.orange,
                                    bmiImage: AssetImage(
                                        "assets/obesity.png"), // Pass AssetImage,
                                  )
                                : const BmiContainer(
                                    bmiTitle: "MORBID OBESITY",
                                    bmiColor: Colors.red,
                                    bmiImage: AssetImage(
                                        "assets/morbid obesity.png"), // Pass AssetImage,
                                  ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${_weightValue.toStringAsFixed(1)} KG",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: 200,
                        value: _weightValue,
                        onChanged: (value) {
                          setState(() {
                            _weightValue = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Height",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${_heightValue.toStringAsFixed(2)} M",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: 3,
                        value: _heightValue,
                        onChanged: (value) {
                          setState(() {
                            _heightValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 400,
            left: MediaQuery.of(context).size.width / 3.4,
            child: Container(
              width: 170.0,
              height: 170.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 19, 19),
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 10.0,
                ),
              ),
              child: Center(
                  child: Text(
                result.toStringAsFixed(2),
                style: const TextStyle(fontSize: 35, color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
