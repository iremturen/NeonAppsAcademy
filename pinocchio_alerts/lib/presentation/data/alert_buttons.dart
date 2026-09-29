import 'package:flutter/material.dart';
import 'package:pinocchio_alerts/presentation/model/alert_button_model.dart';
import 'package:pinocchio_alerts/presentation/alerts/alert_actions.dart';

List<AlertButtonModel> alertButtons(BuildContext context) {
  return [
    AlertButtonModel(
      title: 'No Buttons',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showNoButtons(context),
    ),

    AlertButtonModel(
      title: 'One Button',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showOneButton(context),
    ),

    AlertButtonModel(
      title: 'Two Buttons',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showTwoButtons(context),
    ),

    AlertButtonModel(
      title: 'Text Field',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showTextField(context),
    ),

    AlertButtonModel(
      title: 'Action Sheet',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showActionSheet(context),
    ),

    AlertButtonModel(
      title: 'Activity Controller',
      imagePath: 'assets/images/pencil_icon.png',
      onPressed: () => AlertActions.showActivityController(context),
    ),
  ];
}