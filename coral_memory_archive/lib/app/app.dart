import 'package:coral_memory_archive/app/common/constants/app_colors.dart';
import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/common/di/injection.dart';
import 'package:coral_memory_archive/app/presentation/cubit/coral_memory_cubit.dart';
import 'package:coral_memory_archive/app/presentation/pages/archive_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          updateMemory: injection.updateMemory,
          searchMemories: injection.searchMemories,
          saveAllMemories: injection.saveAllMemories,
          clearAllMemories: injection.clearAllMemories,
        )..loadMemories(),
        child: const ArchivePage(),
      ),
    );
  }
}
