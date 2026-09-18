import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queens_form/core/constants/colors.dart';
import 'package:queens_form/features/presentation/widgets/form_button.dart';
import 'package:queens_form/features/presentation/widgets/form_text_field.dart';

class ChallengeFormPage extends StatefulWidget {
  const ChallengeFormPage({super.key});

  @override
  State<ChallengeFormPage> createState() => _ChallengeFormPageState();
}

class _ChallengeFormPageState extends State<ChallengeFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),

          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.86,
              constraints: const BoxConstraints(maxWidth: 380),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x99000000),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Card(
                color: darkBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/queen.png',
                          width: 80,
                          height: 80,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "Queen's Challenge",
                          style: GoogleFonts.fredoka(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: parchment,
                          ),
                        ),

                        const SizedBox(height: 25),

                        FormTextField(
                          hintText: 'Enter Name-Surname',
                          textColor: red,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        FormTextField(
                          hintText: 'Enter Email',
                          textColor: blue,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }

                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const SizedBox(height: 25),

                        FormTextField(
                          hintText: 'Enter Phone Number',
                          textColor: green,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        FormButton(
                          text: 'Submit',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Well Done! 👑'),
                                    content: const Text(
                                      'The Queen is pleased with your answer.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}