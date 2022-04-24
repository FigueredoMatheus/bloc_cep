part of 'fetch_cep_bloc.dart';

abstract class FetchCepEvent extends Equatable {
  const FetchCepEvent();

  @override
  List<Object> get props => [];
}

class FetchCep extends FetchCepEvent {
  final String cep;

  const FetchCep({required this.cep});

  @override
  List<Object> get props => [cep];
}
