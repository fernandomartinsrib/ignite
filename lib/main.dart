import 'dart:io';
import 'package:ignite/service/api_service.dart';
import 'package:ignite/database/database.dart';
import 'package:ignite/screens/home.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ignite/state/bmi_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    validateStatus: (status) {
      return status != null && status < 500;
    },
  ));
  dio.interceptors.add(LogInterceptor(responseBody: true));

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );

  final apiService = ApiService(dio);
  late AppDatabase database;
  database = AppDatabase();

  runApp(
    BlocProvider(
      create: (context) => IgniteCubit(apiService, database),
      child: MyApp(
        apiService: apiService,
        database: database,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  final AppDatabase database;

  const MyApp({super.key, required this.apiService, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => IgniteCubit(apiService, database),
        child: HomeScreen(database: database),
      ),
    );
  }
}
