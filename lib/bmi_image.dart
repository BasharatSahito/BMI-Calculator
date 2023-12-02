import 'package:flutter/material.dart';

class BmiContainer extends StatefulWidget {
  final String bmiTitle;
  final Color bmiColor;
  final AssetImage bmiImage;
  const BmiContainer(
      {super.key,
      required this.bmiTitle,
      required this.bmiColor,
      required this.bmiImage});

  @override
  State<BmiContainer> createState() => _BmiContainerState();
}

class _BmiContainerState extends State<BmiContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bmiColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: widget.bmiImage,
              height: 200, // Set the desired height
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.bmiTitle,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
