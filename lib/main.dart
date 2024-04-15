import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/home_screen.dart';
import 'blocs/countries_bloc.dart';
import 'data/api/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiClient apiClient =
      ApiClient(graphQLClient: ApiClient.create().graphQLClient);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => CountriesBloc(apiClient: apiClient)..add(FetchCountries()),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
