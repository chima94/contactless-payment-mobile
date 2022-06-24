import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int wallet;
  final String username;
  const HomeState({
    this.wallet = 0,
    this.username = '',
  });

  HomeState copyWith({String? username, int? wallet}) {
    return HomeState(
      wallet: wallet ?? this.wallet,
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [
        wallet,
        username,
      ];
}
