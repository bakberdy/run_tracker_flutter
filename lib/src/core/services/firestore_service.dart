import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart'; // для debugPrint
import 'package:run_tracker_flutter/src/core/models/run_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRun({required String userId, required RunModel run}) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('runs')
          .add(run.toMap());

      debugPrint('[FirestoreService] Run added: ${run.toMap()}');
    } catch (e) {
      debugPrint('[FirestoreService] Failed to add run: $e');
      rethrow;
    }
  }

  Future<List<RunModel>> getRunsOnce(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('runs')
          .orderBy('date', descending: true)
          .get();

      final runs = snapshot.docs.map((doc) {
        return RunModel.fromMap(doc.id, doc.data());
      }).toList();

      debugPrint('[FirestoreService] Fetched ${runs.length} runs');
      return runs;
    } catch (e) {
      debugPrint('[FirestoreService] Failed to fetch runs: $e');
      rethrow;
    }
  }

  Future<void> deleteRun({
    required String userId,
    required String runId,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('runs')
          .doc(runId)
          .delete();

      debugPrint('[FirestoreService] Deleted run with ID: $runId');
    } catch (e) {
      debugPrint('[FirestoreService] Failed to delete run: $e');
      rethrow;
    }
  }

  Future<void> updateRun({
    required String userId,
    required RunModel updatedRun,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('runs')
          .doc(updatedRun.id)
          .update(updatedRun.toMap());

      debugPrint('[FirestoreService] Updated run: ${updatedRun.toMap()}');
    } catch (e) {
      debugPrint('[FirestoreService] Failed to update run: $e');
      rethrow;
    }
  }
}
