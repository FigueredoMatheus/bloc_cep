part of 'fetch_cep_bloc.dart';

abstract class FetchCepState extends Equatable {
  const FetchCepState();

  @override
  List<Object> get props => [];
}

class FetchCepInitial extends FetchCepState {}

class CepNotFound extends FetchCepState {}

class FetchingCep extends FetchCepState {}

class FetchedCep extends FetchCepState {
  final Map cepInfo;

  const FetchedCep({required this.cepInfo}) : super();

  @override
  List<Object> get props => [cepInfo];
}
