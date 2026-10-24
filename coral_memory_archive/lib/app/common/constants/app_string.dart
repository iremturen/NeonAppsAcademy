class AppStrings {
  AppStrings._();

  static const String appTitle = 'Aqualis Coral Archive';
  static const String homePageTitle = 'Hall of Coral';
  static const String memoryDetailsTitle = 'Memory Details';
  static const String searchMemoriesHint =
      'Search by title, species, details...';

  // Menu Actions
  static const String popupEdit = 'Edit';
  static const String popupDelete = 'Delete';
  static const String cardDetails = 'Details';
  static const String actionDetails = 'details';
  static const String actionEdit = 'edit';
  static const String actionDelete = 'delete';

  // Form & CRUD
  static const String addMemory = 'Add Memory';
  static const String addMemorySemanticLabel = 'Add memory';
  static const String editMemory = 'Edit Memory';
  static const String saveMemory = 'Save Memory';
  static const String updateMemory = 'Update Memory';
  static const String deleteMemory = 'Delete Memory';
  static const String confirmDeleteTitle = 'Delete Coral Fragment?';
  static const String confirmDeleteMessage =
      'Are you sure you want to remove this Coral Memory Fragment from the Hall of Coral archives?';
  static String deleteItemConfirmation(String title) =>
      'Delete "$title" from the Hall of Coral archives?';
  static const String cancel = 'Cancel';
  static const String confirm = 'Delete';

  // Labels & Hints
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

  // Fallbacks & Empty States
  static const String notSpecified = 'Not specified';
  static const String noDescriptionAvailable = 'No description available.';
  static const String defaultErrorMessage = 'Something went wrong.';
  static const String emptyFilterMessage =
      'No memories match your query in the Hall of Coral.';
  static const String emptyArchiveMessage =
      'No memories yet in Aqualis.\nAdd your first coral memory!';
  static const String clearFilters = 'Clear Filters ✕';
  static const String allCategory = 'ALL';
  static String fragmentsCount(int count) =>
      '$count coral fragments in archive';

  // Errors & Image
  static const String saveMemoryError = 'Failed to save memory.';
  static const String titleRequiredError = 'Please enter a title.';
  static const String speciesRequiredError = 'Please enter a species.';
  static const String categoryRequiredError = 'Please select a category.';
  static const String locationRequiredError = 'Please enter a location.';
  static const String descriptionRequiredError =
      'Please enter a description.';
  static const String selectMemoryImage = 'Choose image from gallery';
  static const String selectedMemoryImage = 'Image selected';
  static const String imageSelectionError = 'Could not select the image.';

  static const List<String> memoryCategories = [
    'MARINE_LIFE',
    'OCEAN_CURRENTS',
    'ANCIENT_MYTHS',
    'HARD_CORAL',
    'SOFT_CORAL',
    'CORAL_REEF',
    'MARINE_HABITAT',
    'OTHER',
  ];
}
