class IgniteState {
  final String? category;
  final String? selectedOption;
  final String? backgroundImagePath;
  final bool isLoading;
  final String? error;
  String? aiResponse;

  IgniteState({
    this.category,
    this.selectedOption,
    this.backgroundImagePath,
    this.isLoading = false,
    this.error,
    this.aiResponse,
  });

  IgniteState copyWith({
    double? bmi,
    String? category,
    String? selectedOption,
    bool? isLoading,
    String? error,
    String? aiResponse,
    String? backgroundImagePath,
  }) {
    return IgniteState(
      category: category ?? this.category,
      selectedOption: selectedOption ?? this.selectedOption,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      aiResponse: aiResponse ?? this.aiResponse,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
    );
  }

  factory IgniteState.initial() => IgniteState();
}
