class HomeState {
  final int selectedDateIndex;
  final String? selectedMood;
  final int activePageIndex;
  

  const HomeState({
    this.selectedDateIndex = 0,
    required this.selectedMood,
    this.activePageIndex = 0,
  });

  HomeState copyWith({
    int? getSelectedDateIndex,
    String? selectedMood,
    int? getActivePageIndex,

  }) {
    return HomeState(
      selectedDateIndex: getSelectedDateIndex ?? selectedDateIndex,
      selectedMood: selectedMood ?? selectedMood,
      activePageIndex: getActivePageIndex ?? activePageIndex,

    );
  }
}