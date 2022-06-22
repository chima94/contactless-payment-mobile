import 'package:equatable/equatable.dart';

class ScanProductState extends Equatable {
  final bool isLoading;
  final String msg;

  const ScanProductState({
    this.isLoading = false,
    this.msg = '',
  });

  ScanProductState copyWith({bool? isLoading, String? msg}) {
    return ScanProductState(
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
