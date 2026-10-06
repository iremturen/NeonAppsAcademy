import 'package:dream_destinations/common/helpers/shared_preferences_helper.dart';
import 'package:dream_destinations/constants/colors.dart';
import 'package:dream_destinations/constants/dimensions.dart';
import 'package:dream_destinations/presentation/models/custom_button_model.dart';
import 'package:dream_destinations/presentation/models/custom_container_model.dart';
import 'package:dream_destinations/presentation/models/custom_text_model.dart';
import 'package:dream_destinations/presentation/widgets/custom_button.dart';
import 'package:dream_destinations/presentation/widgets/custom_container.dart';
import 'package:dream_destinations/presentation/widgets/custom_counter.dart';
import 'package:dream_destinations/presentation/widgets/custom_text.dart';
import 'package:dream_destinations/presentation/widgets/destination_input.dart';
import 'package:dream_destinations/presentation/widgets/last_visited.dart';
import 'package:dream_destinations/presentation/widgets/visited_question.dart';
import 'package:flutter/material.dart';

class DreamTripView extends StatefulWidget {
  const DreamTripView({super.key});

  @override
  State<DreamTripView> createState() => _DreamTripViewState();
}

class _DreamTripViewState extends State<DreamTripView> {
  bool hasVisited = false;
  int visitCount = 0;
  String? savedDestination;
  bool? savedHasVisited;
  int? savedVisitCount;
  final TextEditingController destinationController = TextEditingController();

  @override
  void dispose() {
    destinationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadSavedTrip();
  }

  Future<void> loadSavedTrip() async {
    final destination = await SharedPreferencesHelper.getDestination();

    final hasVisited = await SharedPreferencesHelper.getHasVisited();

    final visitCount = await SharedPreferencesHelper.getVisitCount();

    if (!mounted) return;

    setState(() {
      savedDestination = destination;
      savedHasVisited = hasVisited;
      savedVisitCount = visitCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        backgroundColor: deepPurple,
        title: CustomText(
          model: CustomTextModel(
            text: 'Jane and John\'s Dream Destination',
            fontSize: appBarFontSize,
            fontWeight: FontWeight.bold,
            color: white,
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: CustomContainer(
            model: CustomContainerModel(
              color: lightPurple,
              borderRadius: borderRadius,
              padding: const EdgeInsets.all(20),
            ),
            child: Column(
              children: [
                DestinationInput(controller: destinationController),
                const SizedBox(height: 20),

                VisitedQuestion(
                  hasVisited: hasVisited,
                  onYes: () {
                    setState(() {
                      hasVisited = true;
                    });
                  },
                  onNo: () {
                    setState(() {
                      hasVisited = false;
                    });
                  },
                ),
                const SizedBox(height: 20),

                CustomText(
                  model: CustomTextModel(
                    text: 'How many times have you visited this place?',
                    fontSize: sectionTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: deepPurple,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 16),

                CustomCounter(
                  value: visitCount,
                  onIncrement: () {
                    setState(() {
                      visitCount++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      visitCount--;
                    });
                  },
                ),
                const SizedBox(height: 32),
              
                CustomButton(
                  model: CustomButtonModel(
                    text: 'Save',
                    backgroundColor: deepPurple,
                    textColor: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    borderRadius: borderRadius,
                  ),
                  onPressed: () async {
                    await SharedPreferencesHelper.saveTrip(
                      destination: destinationController.text,
                      hasVisited: hasVisited,
                      visitCount: visitCount,
                    );

                    setState(() {
                      savedDestination = destinationController.text;
                      savedHasVisited = hasVisited;
                      savedVisitCount = visitCount;
                    });
                  },
                ),
                const SizedBox(height: 16),

                LastVisited(
                  destination: savedDestination,
                  hasVisited: savedHasVisited,
                  visitCount: savedVisitCount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
