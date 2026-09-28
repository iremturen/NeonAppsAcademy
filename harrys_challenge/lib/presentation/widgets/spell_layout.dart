import 'package:flutter/material.dart';

import 'package:harrys_challenge/data/spell_data.dart';
import 'package:harrys_challenge/common/constants/dimensions.dart';
import 'package:harrys_challenge/presentation/widgets/custom_container.dart';

class SpellLayout extends StatelessWidget {
  const SpellLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return ListView.separated(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: spells.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (_, index) => Center(
              child: SizedBox(
                width: spellCardWidth,
                height: spellCardHeight,
                child: CustomContainer(spell: spells[index]),
              ),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth / spells.length;

            return Row(
              children: spells
                  .map(
                    (spell) => SizedBox(
                      width: cardWidth,
                      height: constraints.maxHeight,
                      child: CustomContainer(spell: spell),
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}
