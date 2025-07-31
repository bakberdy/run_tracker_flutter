import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:run_tracker_flutter/src/core/models/run_model.dart';
import 'package:run_tracker_flutter/src/core/services/geocode_services.dart';
import 'package:run_tracker_flutter/src/features/runs/screens/map_screen.dart';
import 'package:run_tracker_flutter/src/features/runs/screens/photo_shower.dart';

class RunCard extends StatelessWidget {
  final RunModel run;

  const RunCard({super.key, required this.run});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(run.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text('📍 ${run.location}'),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('📏 ${run.distance.toStringAsFixed(2)} km'),
                const SizedBox(width: 12),
                Text('⏱️ ${run.duration} min'),
                const SizedBox(width: 12),
                Text('🧮 ${run.pace.toStringAsFixed(2)} min/km'),
              ],
            ),
            if (run.photoUrl != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PhotoShowerScreen(imageUrl: run.photoUrl!),
                      ),
                    );
                  },
                  child: Image.network(
                    run.photoUrl!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            MapScreen(locationName: run.location,),
                      ),
                    );
                  },
                  icon: const Icon(Icons.map),
                  label: const Text('View Map'),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
