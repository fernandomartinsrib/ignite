import 'package:ignite/state/bmi_state.dart';
import 'package:ignite/database/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IgniteCubit extends Cubit<IgniteState> {
  final ApiService _apiService;
  final AppDatabase _database; // Add database instance

  IgniteCubit(this._apiService, this._database) : super(IgniteState.initial());

  Future<void> fetchAIExplanation(
      String inputText, String backgroundImagePath) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final request = APIRequest(
        contents: [
          {
            "parts": [
              {"text": inputText}
            ]
          }
        ],
      );
      final response = await _apiService.generateContent(
        "gemini-1.5-flash-latest",
        dotenv.env['API_KEY'] ?? '',
        request,
      );

      final aiResponse = response.candidates.first.content["parts"][0]["text"];

      // Save AI response to database
      await _database.insertAiResponse(aiResponse);

      emit(state.copyWith(
        aiResponse: aiResponse,
        isLoading: false,
        backgroundImagePath: backgroundImagePath,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
