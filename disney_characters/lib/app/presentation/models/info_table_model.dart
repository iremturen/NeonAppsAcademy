class InfoTableModel {
  final String title;
  final List<InfoTableItem> items;

  const InfoTableModel({
    required this.title,
    required this.items,
  });
}

class InfoTableItem {
  final String label;
  final String value;

  const InfoTableItem({
    required this.label,
    required this.value,
  });
}