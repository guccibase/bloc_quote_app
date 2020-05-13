import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:random_quote_bloc/Models/quote.dart';

class QuoteApiClient{
  final _baseUrl = "https://type.fit/api/quotes";
  final http.Client httpClient;

  QuoteApiClient({@required this.httpClient}):assert(httpClient != null);


  Future<Quote> fetchQuote() async {
    print("response");

    final url = 'https://type.fit/api/quotes';
    final response = await this.httpClient.get(url);

    print(response.body);

    if(response.statusCode != 200){
      throw new Exception('Error Getting Quote');
    }

    final json = jsonDecode(response.body);



    return Quote.fromJson(json);
  }

}