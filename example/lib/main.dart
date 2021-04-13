import 'package:flutter/material.dart';
import 'package:uudi_card_plugin/uudi_card_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controler) => controler.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Demo'),
              backgroundColor: Colors.orange[300],
            ),
            body: UudiCreditCard(listBand: listBand, onTap: _onTap)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  // Bandeiras disponíveis
  List<String> listBand = ['visa', 'mastercard', 'amex', 'elo', 'dinersclub', 'discover', 'jcb', 'aura', 'hiper', 'hipercard', 'rupay'];

  _onTap() async {
    print('Numero do cartão: $creditCardNumber'); // Numero do cartão digitado
    print('Nome no cartão: $creditCardName'); // Nome no cartão digitado
    print('Valido até: $creditCardExpData'); // Validade do cartão
    print('CVV: $creditCardCVV'); // Código de segurança
    print('Bandeira: $creditCardBand'); // Bandeira do cartão
    print('CPF: $creditCardCPF'); // CPF do Titular
  }
}