

import 'package:equatable/equatable.dart';

abstract class QuoteEvents extends Equatable{
  const QuoteEvents();
}

class FetchQuote extends QuoteEvents{
  const FetchQuote();

  @override
  List<Object> get props => [];


}