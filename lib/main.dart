import 'package:cabit/src/features/trip/Presentation/bloc/trip_bloc.dart';
import 'package:cabit/src/features/trip/Presentation/pages/book_new_trip_page.dart';
import 'package:cabit/src/features/trip/data/datasources/remote/trip_remote_datasource.dart';
import 'package:cabit/src/features/trip/data/datasources/remote/trip_remote_datasource_impl.dart';
import 'package:cabit/src/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:cabit/src/features/trip/domain/repositories/trip_repository.dart';
import 'package:cabit/src/features/trip/domain/usecases/get_location_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GetLocationSuggestions getLocationSuggestions;

  @override
  void initState() {
    super.initState();
    final TripRemoteDataSource remoteDataSource = TripRemoteDatasourceImpl(client: http.Client());
    final TripRepository repository = TripRepositoryImpl(remoteDataSource: remoteDataSource);
    getLocationSuggestions = GetLocationSuggestions(repository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc(getLocationSuggestions: getLocationSuggestions),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const BookNewTripPage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('CabIt'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: .center, children: [const Text('Welcome to cabIT')]),
      ),
    );
  }
}
