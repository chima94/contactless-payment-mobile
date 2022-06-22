import 'package:equatable/equatable.dart';

abstract class TopUpEvent extends Equatable {
  const TopUpEvent();

  @override
  List<Object> get props => [];
}

class TopUpKeypadEvent extends TopUpEvent {
  final String text;
  const TopUpKeypadEvent({required this.text});
}

class TopUpResetEvent extends TopUpEvent {
  const TopUpResetEvent();
}

class TopUpSubmitEvent extends TopUpEvent {
  const TopUpSubmitEvent();
}
