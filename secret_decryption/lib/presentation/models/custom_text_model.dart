import 'package:flutter/material.dart';

class CustomTextModel {
	final String text;
	final double? fontSize;
	final FontWeight? fontWeight;
	final Color? color;
	final TextAlign? textAlign;

	const CustomTextModel({
		required this.text,
		this.fontSize,
		this.fontWeight,
		this.color,
		this.textAlign,
	});
}
