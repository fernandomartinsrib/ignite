import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://generativelanguage.googleapis.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/v1beta/models/{model}:generateContent")
  Future<APIResponse> generateContent(
    @Path("model") String model,
    @Query("key") String apiKey,
    @Body() APIRequest request,
  );
}

@JsonSerializable()
class APIRequest {
  final List<Map<String, dynamic>> contents;

  APIRequest({required this.contents});

  factory APIRequest.fromJson(Map<String, dynamic> json) =>
      _$APIRequestFromJson(json);
  Map<String, dynamic> toJson() => _$APIRequestToJson(this);
}

@JsonSerializable()
class APIResponse {
  final List<Candidate> candidates;

  APIResponse({required this.candidates});

  factory APIResponse.fromJson(Map<String, dynamic> json) =>
      _$APIResponseFromJson(json);
  Map<String, dynamic> toJson() => _$APIResponseToJson(this);
}

@JsonSerializable()
class Candidate {
  final Map<String, dynamic> content;

  Candidate({required this.content});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);
  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
