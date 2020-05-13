
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_bloc/Models/quote.dart';
import 'package:random_quote_bloc/bloc/quote_events.dart';
import 'package:random_quote_bloc/bloc/quote_state.dart';
import 'package:random_quote_bloc/date/repo/quote_repo.dart';

class QuoteBloc extends Bloc<QuoteEvents, QuoteState>{
  final QuoteRepository quoteRepository;

  QuoteBloc({@required this.quoteRepository}): assert(quoteRepository != null);

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvents event) async* {
    if(event is FetchQuote){
      yield QuoteLoading();

      try{
        final Quote quote = await quoteRepository.fetchQuote();
        yield QuoteLoaded(quote: quote);


      }catch(_){
        yield QuoteError();
      }
    }
  }


}