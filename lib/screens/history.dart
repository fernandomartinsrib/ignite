import 'package:ignite/database/database.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<AiResponse> responses;
  final String backgroundImage;

  const HistoryScreen(
      {super.key, required this.responses, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motivation History'),
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          SafeArea(
            child: responses.isEmpty
                ? const Center(
                    child: Text(
                      'No motivation insights yet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: responses.length,
                    itemBuilder: (context, index) {
                      // Reverse the order to show newest
                      final response = responses[responses.length - 1 - index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                response.response,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                response.createdAt.toString().substring(0, 16),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
