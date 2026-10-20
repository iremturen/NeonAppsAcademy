class AppStrings {
  AppStrings._();

  static const String appTitle = 'Aqualis';
  static const String homePageTitle = 'Coral Memory Archive';
  static const String searchMemoriesHint = 'Search memories...';
  static const String popupEdit = 'Edit';
  static const String popupDelete = 'Delete';
  static const String cardDetails = 'Details';

  static const String addMemory = 'Add Memory';
  static const String saveMemory = 'Save Memory';
  static const String titleLabel = 'Title';
  static const String speciesLabel = 'Species';
  static const String categoryLabel = 'Category';
  static const String locationLabel = 'Location';
  static const String discoveryDateLabel = 'Discovery Date';
  static const String descriptionLabel = 'Description';
  static const String titleHint = 'Enter title';
  static const String speciesHint = 'Enter species';
  static const String locationHint = 'Enter location';
  static const String descriptionHint = 'Enter description';
  static const String saveMemoryError = 'Failed to save memory.';
  static const String titleRequiredError = 'Please enter a title.';
  static const String speciesRequiredError = 'Please enter a species.';
  static const String categoryRequiredError = 'Please select a category.';
  static const String locationRequiredError = 'Please enter a location.';
  static const String descriptionRequiredError = 'Please enter a description.';
  static const String selectMemoryImage = 'Choose image from gallery';
  static const String selectedMemoryImage = 'Image selected';
  static const String imageSelectionError = 'Could not select the image.';

  static const List<String> memoryCategories = [
    'HARD_CORAL',
    'SOFT_CORAL',
    'CORAL_REEF',
    'MARINE_HABITAT',
    'OTHER',
  ];
}
