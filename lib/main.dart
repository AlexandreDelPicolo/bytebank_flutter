import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencias extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferencia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(
              controlador: _controladorNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorValor,
              rotulo: 'Valor',
              dica: '00.0',
              icone: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criarTransferencia(context),
              ),
            ),
          ],
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        actions: [],
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 88457)),
          ItemTransferencia(Transferencia(200.0, 88457)),
          ItemTransferencia(Transferencia(300.0, 88457))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencias();
            }),
          );
          future.then((transferenciaRecebida) {
            print('$transferenciaRecebida');
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() =>
      'Transferencia(valor: $valor, numeroConta: $numeroConta)';
}
