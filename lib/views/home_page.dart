import 'package:bloc_cep/bloc/fetch_cep_bloc.dart';
import 'package:bloc_cep/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool invalidCep = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF010A16),
        title: const Text('Pesquisa de CEP'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: MyThemes.backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  maxLength: 8,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (text) {
                    if (text != null && text.isEmpty) {
                      return 'Informe um CEP';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyThemes.greenColor,
                    ),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      if (cepController.text.length < 8) {
                        setState(() {
                          invalidCep = true;
                        });
                        return;
                      }
                      setState(() {
                        invalidCep = false;
                      });
                      context.read<FetchCepBloc>().add(
                            FetchCep(cep: cepController.text),
                          );
                    },
                    child: const Text('Pesquisar'),
                  ),
                ),
                const SizedBox(height: 20),
                if (invalidCep)
                  const Text(
                    'CEP inválido.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                BlocBuilder<FetchCepBloc, FetchCepState>(
                  builder: (context, state) {
                    if (state is CepNotFound) {
                      return const Text(
                        'CEP não encontrado',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }

                    if (state is FetchingCep) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      );
                    }

                    if (state is FetchedCep) {
                      return Column(
                        children: [
                          Text(
                            'Localidade:  ${state.cepInfo['localidade']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'logradouro: ${state.cepInfo['logradouro']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
