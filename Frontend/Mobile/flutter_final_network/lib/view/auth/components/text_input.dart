import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText, typeTilte;
  final TextInputType textInputType;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      required this.isPass,
      required this.hintText,
      required this.textInputType,
      required this.typeTilte});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            typeTilte,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
          ),
          TextField(
            style: const TextStyle(
              fontSize: 19,
            ),
            controller: textEditingController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Color.fromARGB(255, 205, 207, 205)), //<-- SEE HERE
              ),
            ),
            keyboardType: textInputType,
            obscureText: isPass,
            enableInteractiveSelection: false,
          ),
        ],
      ),
    );
  }
}
