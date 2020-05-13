import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_bloc/bloc/bloc.dart';
import 'package:random_quote_bloc/date/repo/quote_api_client.dart';
import 'package:random_quote_bloc/date/repo/quote_repo.dart';
import 'package:http/http.dart' as http;
import 'package:random_quote_bloc/views/home_page.dart';



class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
    )
  );
  runApp(MyApp(
    repository: repository,
  ));
}

class MyApp extends StatelessWidget {

  final QuoteRepository repository;
  MyApp({Key key, @required this.repository}): assert(repository != null), super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',

      home: Scaffold(
        appBar: AppBar(
          title: Text("Quote"),
        ),
          body: BlocProvider(
        create: (context) => QuoteBloc(quoteRepository: repository),
            child: MyHomePage(),
        ),
    ), );
  }

}

