import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_tracker_flutter/src/core/models/run_model.dart';
import 'package:run_tracker_flutter/src/features/runs/bloc/runs_bloc.dart';
import 'package:run_tracker_flutter/src/features/runs/screens/add_run_screen.dart';
import 'package:run_tracker_flutter/src/features/runs/widgets/run_card.dart';
import 'package:run_tracker_flutter/src/features/runs/widgets/run_state_header.dart';

class RunsDashboardScreen extends StatefulWidget {
  const RunsDashboardScreen({super.key});

  @override
  State<RunsDashboardScreen> createState() => _RunsDashboardScreenState();
}

class _RunsDashboardScreenState extends State<RunsDashboardScreen> {
  @override
  void initState() {
    context.read<RunsBloc>().add(RunsEvent.loadRuns());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRunScreen()));
        },
        icon: Icon(Icons.add),
        label: Text('Add run'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Run tracker'), actions: [TextButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, child: Text('Sign Out'))],),
          SliverToBoxAdapter(
            child: RunStatsHeader(
              totalRuns: 10,
              totalDistanceKm: 10,
              averagePace: 10,
            ),
          ),
          BlocBuilder<RunsBloc, RunsState>(
            builder: (context, state) {
              List<RunModel> runs = [];
              if(state is RunsLoaded){
                runs = state.runs;
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final run = runs[index];
                  return RunCard(run: run);
                }, childCount: runs.length),
              );
            }
          ),
        ],
      ),
    );
  }
}
