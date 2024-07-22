import 'package:flutter/material.dart';
import 'package:tablitsacheyto/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/screens/user_greeting.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userProvider);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Shulte table',
      home: userName == null ? const NameScreen() : const MyHomePage(),
    );
  }
}
