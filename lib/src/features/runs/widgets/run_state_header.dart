import 'package:flutter/material.dart';

class RunStatsHeader extends StatelessWidget {
  final int totalRuns;
  final double totalDistanceKm;
  final double averagePace; 

  const RunStatsHeader({
    super.key,
    required this.totalRuns,
    required this.totalDistanceKm,
    required this.averagePace,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem("Runs", totalRuns.toString()),
            _buildStatItem("Distance", "${totalDistanceKm.toStringAsFixed(1)} km"),
            _buildStatItem("Avg Pace", "${averagePace.toStringAsFixed(1)} min/km"),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

