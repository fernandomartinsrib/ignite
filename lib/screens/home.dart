import 'package:ignite/state/bmi_cubit.dart';
import 'package:ignite/state/bmi_state.dart';
import 'package:ignite/database/database.dart';
import 'package:ignite/screens/history.dart';
import 'package:ignite/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final AppDatabase database;

  const HomeScreen({
    super.key,
    required this.database,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<IgniteCubit, IgniteState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        } else if (state.aiResponse != null && state.isLoading == false) {
          // close any open dialogs
          Navigator.of(context).pop();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                storedAiResponse: state.aiResponse,
                backgroundImage: state.backgroundImagePath,
              ),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildOptionCard(
                context,
                title: 'Study',
                backgroundImage: 'assets/img_1_flutter.png',
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                title: 'Business',
                backgroundImage: 'assets/img_2_flutter.png',
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                title: 'Wellness & Mind & Body',
                backgroundImage: 'assets/img_3_flutter.png',
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                title: 'GYM',
                backgroundImage: 'assets/img_4_flutter.png',
              ),
              const SizedBox(height: 16),
              _buildHistoryCard(
                context,
                title: 'History',
                backgroundImage: 'assets/img_5_flutter.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String backgroundImage,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFAF9164), // Muted bronze gold
          width: 2,
        ),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.zero, // Remove default margin
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                ),
              ),
            );

            final prompt = """
Craft a deeply motivational message about $title that 
challenges personal limitations, emphasizes growth mindset, 
and provides actionable insights for self-improvement. 
Focus on resilience, strategic thinking, and 
transformative potential. A short text, maximum of 10 rows. Never repeat a message you've sent before""";
            context
                .read<IgniteCubit>()
                .fetchAIExplanation(prompt, backgroundImage);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryCard(
    BuildContext context, {
    required String title,
    required String backgroundImage,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFAF9164), // Muted bronze gold
          width: 2,
        ),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.zero, // Remove default margin
        child: InkWell(
          onTap: () async {
            // Fetch all responses from the database
            final responses = await database.getAllResponses();

            // Navigate to a new screen with the fetched responses
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(
                  responses: responses,
                  backgroundImage: 'assets/img_5_flutter.png',
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
