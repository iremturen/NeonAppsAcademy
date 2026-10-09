import 'package:laugh_house/data/enum/show_status.dart';

class ShowModel {
  final String title;
  final String imageUrl;
  final String artist;
  final String date;
  final String time;
  final int ticketPrice;
  final String dateDay;
  final String dateMonth;
  final ShowStatus status;

  const ShowModel({
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.date,
    required this.time,
    required this.ticketPrice,
    required this.dateDay,
    required this.dateMonth,
    required this.status,
  });
}
