import 'package:flutter/material.dart';

class CustomButtonModel {
	final String text;
	final Color color;
	final Color textColor;
	final VoidCallback onPressed;

	const CustomButtonModel({
		required this.text,
		required this.color,
		required this.textColor,
		required this.onPressed,
	});
}
