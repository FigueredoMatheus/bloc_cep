import 'package:bloc_cep/bloc/fetch_cep_bloc.dart';
import 'package:bloc_cep/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCepBloc(),
      child: MaterialApp(
        title: 'Bloc CEP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.loraTextTheme(),
        ),
        home: const HomePage(),
      ),
    );
  }
}
