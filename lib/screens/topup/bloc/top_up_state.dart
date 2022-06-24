import 'package:equatable/equatable.dart';

class TopUpState extends Equatable {
  String text;
  bool isLoading;
  String msg;

  TopUpState({
    this.text = '',
    this.isLoading = false,
    this.msg = '',
  });

  TopUpState copyWith({
    required String text,
    bool? isLoading,
    String? msg,
  }) {
    var data = text.isEmpty ? text : this.text + text;
    if (data.length > 6) {
      return TopUpState(
          text: this.text,
          isLoading: isLoading ?? this.isLoading,
          msg: msg ?? this.msg);
    } else {
      return TopUpState(
        text: data,
        isLoading: isLoading ?? this.isLoading,
        msg: msg ?? this.msg,
      );
    }
  }

  @override
  List<Object> get props => [
        text,
        isLoading,
        msg,
      ];
}
