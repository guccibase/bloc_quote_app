import 'package:equatable/equatable.dart';
class Quote extends Equatable{
  final text;
  final author;
  final List<dynamic> list;

  Quote({this.list, this.text, this.author});


  @override
  List<Object> get props => [text,author];

  static Quote fromJson(dynamic json){
    return Quote(
      list: json,
    text: json[0]['text'],
    author: json[0]['author'],

    );
  }

  @override
  String toString() {
    return ('Quote { text: $text }');
  }

}