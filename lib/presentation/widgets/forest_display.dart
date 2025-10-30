import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class ForestDisplay extends StatelessWidget {
  final int completedSessions;

  const ForestDisplay({Key? key, required this.completedSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forest = List.generate(completedSessions.clamp(0, 24), (i) {
      const emojis = ["🌳", "🌲", "🌴", "🎄"];
      return emojis[i % emojis.length];
    });

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Forest',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.emerald.shade900),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: forest.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    forest[index],
                    style: const TextStyle(fontSize: 32),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              '${forest.length} trees planted from your focused sessions!',
              style: TextStyle(color: AppColors.emerald.shade700, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
