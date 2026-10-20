import 'package:coral_memory_archive/presentation/cubit/coral_memory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coral_memory_archive/common/constants/app_colors.dart';
import 'package:coral_memory_archive/common/constants/app_string.dart';
import 'package:coral_memory_archive/common/di/injection.dart';
import 'package:coral_memory_archive/presentation/pages/archive_page.dart';

class CoralMemoryApp extends StatelessWidget {
  final Injection injection;

  const CoralMemoryApp({
    super.key,
    required this.injection,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.teal,
          brightness: Brightness.dark,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.mist,
      ),
      home: BlocProvider(
        create: (_) => CoralMemoryCubit(
          getAllMemories: injection.getAllMemories,
          saveMemory: injection.saveMemory,
          deleteMemory: injection.deleteMemory,
        )..loadMemories(),
        child: const ArchivePage(),
      ),
    );
  }
}
