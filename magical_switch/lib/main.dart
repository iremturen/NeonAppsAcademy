import 'package:flutter/material.dart';
import 'core/constants/color.dart';
import 'presentation/widgets/custom_title_text.dart';
import 'presentation/widgets/magical_switch.dart';

void main() {
  runApp(const MagicalSwitchApp());
}

class MagicalSwitchApp extends StatefulWidget {
  const MagicalSwitchApp({super.key});
  @override
  State<MagicalSwitchApp> createState() => _MagicalSwitchAppState();
}

class _MagicalSwitchAppState extends State<MagicalSwitchApp> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: isOn ? magicGreen : magicRed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/sparkles_top.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/background_transparent_bottom.png',
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTitleText(
                    text: 'Magical Switch',
                    fontSize: 48,
                    fontWeight: FontWeight.normal,
                    color: cream,
                  ),
                  const SizedBox(height: 20),
                  MagicalSwitch(
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
