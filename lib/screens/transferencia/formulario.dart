import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _numeroContaRotulo = 'Número da conta';
const _numeroContaDica = '0000';
const _valorRotulo = 'Valor';
const _valorDica = '00.00';
const _confirmarBotao = 'Confirmar';

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controlador: _controladorNumeroConta,
                rotulo: _numeroContaRotulo,
                dica: _numeroContaDica,
              ),
              Editor(
                controlador: _controladorValor,
                rotulo: _valorRotulo,
                dica: _valorDica,
                icone: Icons.monetization_on,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text(_confirmarBotao),
                  onPressed: () => _criarTransferencia(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criarTransferencia(context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);

    if (numeroConta <= 0 && valor <= 0) return;

    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
  }
}
