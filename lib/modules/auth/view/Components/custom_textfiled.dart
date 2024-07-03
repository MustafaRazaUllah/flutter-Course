import 'package:flutter/material.dart';

class CustomTextfiled extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  const CustomTextfiled({
    super.key,
    required this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText ?? ""),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            // label: Text(labelText ?? ""),
            // labelText: labelText,
          ),
        ),
      ],
    );
  }
}
