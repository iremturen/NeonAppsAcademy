import 'package:adapty_flutter/adapty_flutter.dart';
import 'package:flutter/material.dart';

import 'constants/app_strings.dart';
import 'constants/app_colors.dart';
import 'screens/in_app_screen.dart';
import 'screens/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Adapty().activate();
    debugPrint('Adapty initialized successfully.');
  } catch (e) {
    debugPrint('Adapty initialization failed: $e');
  }

  runApp(const AdaptyApp());
}

class AdaptyApp extends StatelessWidget {
  const AdaptyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.surface,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const PremiumCheckScreen(),
    );
  }
}

class PremiumCheckScreen extends StatefulWidget {
  const PremiumCheckScreen({super.key});

  @override
  State<PremiumCheckScreen> createState() => _PremiumCheckScreenState();
}

class _PremiumCheckScreenState extends State<PremiumCheckScreen> {
  late final Future<bool> _premiumStatus;

  @override
  void initState() {
    super.initState();
    _premiumStatus = _checkPremiumStatus();
  }

  Future<bool> _checkPremiumStatus() async {
    try {
      final profile = await Adapty().getProfile();
      return profile.accessLevels['premium']?.isActive ?? false;
    } catch (e) {
      debugPrint('Premium status check failed: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _premiumStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return const MainScreen();
        }

        return const InAppScreen();
      },
    );
  }
}
