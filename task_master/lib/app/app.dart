import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_master/app/common/constants/app_colors.dart';
import 'package:task_master/app/common/constants/app_string.dart';
import 'package:task_master/app/data/datasources/local/task_local_datasource.dart';
import 'package:task_master/app/data/models/task_model.dart';
import 'package:task_master/app/data/repositories/task_repository_impl.dart';
import 'package:task_master/app/presentation/blocs/cubits/task_cubit.dart';
import 'package:task_master/app/presentation/pages/splash_page.dart';

class TaskMasterApp extends StatelessWidget {
  final Box<TaskModel> taskBox;

  const TaskMasterApp({
    super.key,
    required this.taskBox,
  });

  @override
  Widget build(BuildContext context) {
    final localDataSource = TaskLocalDataSource(taskBox);
    final repository = TaskRepositoryImpl(localDataSource);

    return BlocProvider(
      create: (_) => TaskCubit(repository)..loadTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const SplashPage(),
      ),
    );
  }
}