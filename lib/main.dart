import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_ai/blocs/bloc/media_bloc.dart';
import 'package:hear_ai/screens/home_screen.dart';
import 'package:hear_ai/screens/media_upload_screen.dart';
import 'package:hear_ai/services/media_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaBloc(MediaService())..add(const FetchMedia()),
      child: MaterialApp(
        routes: {
          '/': (context) => const HomeScreen(),
          '/upload': (context) => const MediaUploadScreen(),
        },
      ),
    );
  }
}
