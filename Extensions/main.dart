import 'extensions/int_extension.dart';
import 'extensions/string_extension.dart';
import 'extensions/bool_extension.dart';
import 'extensions/set_extension.dart';
import 'extensions/map_extension.dart';
import 'extensions/date_time_extension.dart';

void main() {
  printColored("\n---Test String Extension--");
  String str1 = "neon";
  print(" Is '${str1}' Palindrome?: ${str1.isPalindrome()}");
  String str2 = "noon";
  print(" Is '${str2}' Palindrome?: ${str2.isPalindrome()}");

  printColored("\n---Test Int Extension --");
  int num1 = 53;
  print(" Is ${num1} Prime?: ${num1.isPrime()}");
  int num2 = 81;
  print(" Is ${num2} Prime?: ${num2.isPrime()}");

  printColored("\n--- Test DateTime Extension ---");
  final startDate = DateTime(2025, 4, 9);
  final endDate = DateTime(2026, 4, 9);
  print("Start date: $startDate");
  print("End date: $endDate");
  print("Days between dates: ${startDate.daysBetween(endDate)}");

  printColored("\n--- Test Bool Extension ---");
  print("true && false: ${true.and(false)}");
  print("true || false: ${true.or(false)}");
  print("true!: ${true.not()}");
  print("true XOR false: ${true.xor(false)}");

  printColored("\n--- Test Set Extension ---");
  final complaintList = [
    "Citizens are tired of repetitive daily tasks.",
    "Citizens need an easier way to plan important dates.",
    "Citizens are tired of repetitive daily tasks.",
    "Families need to be listed by surname for the census.",
    "Citizens need an easier way to plan important dates.",
  ];
  print("Complaints before method: $complaintList");
  print("Number before method: ${complaintList.length}\n");

  final uniqueComplaints = complaintList.removeDuplicateComplaints();
  print("Complaints after method: $uniqueComplaints");
  print("Number after method: ${uniqueComplaints.length}");

  printColored("\n--- Test Map Extension ---");
  final members = <String, String>{
    "İrem": "Türen",
    "Elif": "Türen",
    "Zehra Nur": "Baş",
    "Ahmet": "Baş",
    "Ali": "Kulbak",
  };
  final census = members.countMembersBySurname();
  print("Family member count by surname: $census\n");
}

void printColored(String text) {
  const pink = '\x1b[38;5;39m';
  const reset = '\x1B[0m';
  print('$pink$text$reset');
}
