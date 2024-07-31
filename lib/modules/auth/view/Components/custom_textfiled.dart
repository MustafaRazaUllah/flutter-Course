import 'package:flutter/material.dart';

class CustomTextfiled extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function? onChange;
  const CustomTextfiled({
    super.key,
    required this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.onChange,
  });

  @override
  State<CustomTextfiled> createState() => _CustomTextfiledState();
}

class _CustomTextfiledState extends State<CustomTextfiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText ?? ""),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          onChanged: (v) {
            if (widget.onChange != null) {
              widget.onChange!(v);
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
