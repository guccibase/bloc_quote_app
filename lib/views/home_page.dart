import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_bloc/bloc/bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state){
        if(state is QuoteEmpty){
          BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
        }
        if(state is QuoteError){
          return Center(
            child: Text("Failed to fetch quote"),
          );
        }
        if(state is QuoteLoaded){
          return ListView.builder(
            itemCount: state.quote.list.length,
            itemBuilder: (BuildContext context, index){
              return ListTile(
                leading: Text('Quote',style: TextStyle(fontSize: 10.0
                ),),
                title: Text(state.quote.list[index]['text']),
                isThreeLine: true,
                subtitle: Text(state.quote.list[index]['author'].toString()),
                dense: true,
              );
            }
          );

        }
        return Center(
        child: CircularProgressIndicator(),
        );
      },

    );
  }
}
