import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/character/view/bloc/character_bloc.dart';
import 'package:kdigital_test/src/character/view/pages/character_list_page.dart';
import 'package:kdigital_test/src/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CharacterBloc(sl()),
        child: CharacterListPage(),
      ),
    );
  }
}
