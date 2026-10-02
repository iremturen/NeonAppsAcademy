import 'package:flutter/material.dart';
import 'package:picker_challenge/presentation/models/custom_button_model.dart';

class CustomButton extends StatelessWidget {
	final CustomButtonModel model;

	const CustomButton({
		super.key,
		required this.model,
	});

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: model.onPressed,
			style: ElevatedButton.styleFrom(
				backgroundColor: model.color,
				foregroundColor: model.textColor,
			),
			child: Text(model.text),
		);
	}
}
