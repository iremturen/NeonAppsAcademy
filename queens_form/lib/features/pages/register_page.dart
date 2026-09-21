import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/colors.dart';
import '../widgets/form_button.dart';
import 'package:queens_form/features/widgets/form_text_field.dart';
import 'challenge_form_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 36,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/crown.png',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Royal Register',
                        style: GoogleFonts.fredoka(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: parchment,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Enter your details',
                        style: GoogleFonts.fredoka(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: lightBlue,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            FormTextField(
                              hintText: 'Enter Name - Surname',
                              textColor: red,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            FormTextField(
                              hintText: 'Enter Email',
                              textColor: blue,
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 12),
                            FormTextField(
                              hintText: 'Enter Phone Number',
                              textColor: green,
                              textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      FormButton(
                        text: 'Register',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChallengeFormPage(),
                            ),
                          );
                        },
                      ),
                    ],
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
