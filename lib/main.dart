import 'package:flutter/material.dart';
import 'package:hdfc_test/presentation/home_screen.dart';
import 'package:hdfc_test/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'data/data_user.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>UserProvider()),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
