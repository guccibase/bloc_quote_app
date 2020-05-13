import 'package:flutter/cupertino.dart';
import 'package:random_quote_bloc/Models/quote.dart';
import 'package:random_quote_bloc/date/repo/quote_api_client.dart';
import 'package:meta/meta.dart';

class QuoteRepository{
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient}) : assert(quoteApiClient != null);



  Future<Quote> fetchQuote() async{
    return await quoteApiClient.fetchQuote();
  }



}