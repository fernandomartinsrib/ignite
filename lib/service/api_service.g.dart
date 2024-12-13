// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIRequest _$APIRequestFromJson(Map<String, dynamic> json) => APIRequest(
      contents: (json['contents'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$APIRequestToJson(APIRequest instance) =>
    <String, dynamic>{
      'contents': instance.contents,
    };

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) => APIResponse(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIResponseToJson(APIResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      content: json['content'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'content': instance.content,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://generativelanguage.googleapis.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<APIResponse> generateContent(
    String model,
    String apiKey,
    APIRequest request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<APIResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1beta/models/${model}:generateContent',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = APIResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
