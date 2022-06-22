import 'package:equatable/equatable.dart';

class TopUpState extends Equatable {
  String text;
  TopUpState({this.text = ''});

  TopUpState copyWith({
    required String text,
  }) {
    var data = text.isEmpty ? text : this.text + text;
    if (data.length > 6) {
      return TopUpState(text: this.text);
    } else {
      return TopUpState(text: data);
    }
  }

  @override
  List<Object> get props => [
        text,
      ];
}
