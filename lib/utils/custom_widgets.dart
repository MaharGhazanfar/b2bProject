import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;

  const CustomText(
      {Key? key,
      required this.title,
      this.color = Colors.black,
      this.fontSize = 15,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool readOnly;
  final int? maxLength;

  const CustomTextField(
      {Key? key,
      this.readOnly = false,
      this.hint,
      this.maxLength,
      this.validator,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 25,
      onChanged: onChanged,
      maxLength: maxLength,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      // Aligns the text to the center
      decoration: InputDecoration(
        filled: true,
        constraints: const BoxConstraints(
          maxHeight: 50,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Sets a circular shape
          borderSide: BorderSide.none, // Removes the border
        ),
        hintText: hint,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final double? fontSize;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(8.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        child: CustomText(
          title: title,
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ));
  }
}

customToast({String? msg, Color? color}) {
  Fluttertoast.showToast(
      msg: msg!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
