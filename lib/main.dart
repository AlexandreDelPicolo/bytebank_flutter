import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Transferências'),
            actions: [],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          body: ListaTransferencias(),
        ),
      ),
    );

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTrasnferencia(Transferencia(100.0, 88457)),
        ItemTrasnferencia(Transferencia(200.0, 88457)),
        ItemTrasnferencia(Transferencia(300.0, 88457))
      ],
    );
  }
}

class ItemTrasnferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTrasnferencia(this._transferencia);

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
}
