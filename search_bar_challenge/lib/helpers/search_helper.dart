import 'package:search_bar_challenge/data/model/member_model.dart';

class SearchHelper {
  static List<PersonModel> filterPeople({
    required List<PersonModel> people,
    required String searchText,
    required String selectedValue,
  }) {
    final search = searchText.toLowerCase();

    return people.where((person) {
      if (selectedValue == 'name') {
        return person.name.toLowerCase().contains(search);
      }

      return person.surname.toLowerCase().contains(search);
    }).toList();
  }
}