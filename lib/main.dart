import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_tracker_flutter/firebase_options.dart';
import 'package:run_tracker_flutter/src/core/services/firestore_service.dart';
import 'package:run_tracker_flutter/src/features/auth/bloc/login_bloc.dart';
import 'package:run_tracker_flutter/src/features/auth/screens/login_screen.dart';
import 'package:run_tracker_flutter/src/features/runs/bloc/runs_bloc.dart';
import 'package:run_tracker_flutter/src/features/runs/screens/runs_dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=> RunsBloc(fireStoreService: FirestoreService())),
        BlocProvider(create:(_)=> LoginBloc())
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Run Tracker',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            return const RunsDashboardScreen();
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
