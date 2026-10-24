import 'dart:io';
import 'package:coral_memory_archive/app/app.dart';
import 'package:coral_memory_archive/app/common/constants/app_string.dart';
import 'package:coral_memory_archive/app/common/di/injection.dart';
import 'package:coral_memory_archive/app/data/datasources/local/objectbox_database.dart';
import 'package:coral_memory_archive/objectbox.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory tempDir;
  late Store store;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('aqualis_widget_test_');
    store = Store(getObjectBoxModel(), directory: tempDir.path);
  });

  tearDown(() {
    store.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  testWidgets('Aqualis Coral Archive smoke test', (WidgetTester tester) async {
    final database = ObjectBoxDatabase(store);
    final injection = Injection(database);

    await tester.pumpWidget(CoralMemoryApp(injection: injection));
    await tester.pumpAndSettle();

    // Verify AppBar title is displayed
    expect(find.text(AppStrings.appTitle), findsOneWidget);

    // Verify search bar is displayed
    expect(find.text(AppStrings.searchMemoriesHint), findsOneWidget);

    // Verify empty archive state message
    expect(find.textContaining('No memories yet'), findsOneWidget);
  });
}
