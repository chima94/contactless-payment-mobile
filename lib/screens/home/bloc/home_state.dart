import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String msg;

  const HomeState({
    this.isLoading = false,
    this.msg = '',
  });

  HomeState copyWith({bool? isLoading, String? msg}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        msg,
      ];
}
