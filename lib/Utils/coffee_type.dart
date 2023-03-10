import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeName;
  final bool isSelected;
  final VoidCallback onTap;
  const CoffeeType(
      {Key? key,
      required this.coffeeName,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 15,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              coffeeName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isSelected ? Colors.orange : Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          isSelected
              ? Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                )
              : Container()
        ],
      ),
    );
  }
}
