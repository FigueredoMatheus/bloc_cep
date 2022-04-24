import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'fetch_cep_event.dart';
part 'fetch_cep_state.dart';

class FetchCepBloc extends Bloc<FetchCepEvent, FetchCepState> {
  FetchCepBloc() : super(FetchCepInitial()) {
    on<FetchCep>(_onFetchingCep);
  }

  void _onFetchingCep(FetchCep event, Emitter<FetchCepState> emit) async {
    emit(FetchingCep());

    await Future.delayed(const Duration(seconds: 2), () async {
      final response =
          await Dio().get('https://viacep.com.br/ws/${event.cep}/json/');

      final Map cepInfo = response.data as Map;

      if (cepInfo.containsKey('erro')) {
        emit(CepNotFound());
      } else {
        emit(
          FetchedCep(cepInfo: cepInfo),
        );
      }
    });
  }
}
