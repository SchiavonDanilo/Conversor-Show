import 'package:conversor_imc_flutter/src/views/components/espacamento_h.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_w.dart';
import 'package:conversor_imc_flutter/src/views/components/titulo2.dart';
import 'package:flutter/material.dart';

class CalcIMC extends StatefulWidget {
  @override
  _CalcIMCState createState() => _CalcIMCState();
}

class _CalcIMCState extends State<CalcIMC> {
 double peso;
 double altura;
  double resultado;
var resposta = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                EspacamentoH(h: 20),
                Image.asset(
                  'assets/images/icon_imc.png',
                  width: 200,
                  height: 200,
                ),
                // Container de espaçamento:
                EspacamentoH(h: 20),
                Titulo2(txt: "Calculadora IMC:"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Peso:
                    Expanded(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Peso'),
                          onChanged: (value){
                           setState(() {
                           
                           peso = double.parse(value);
                           });

                          },

                        )),
                    // Container de espaçamento:
                    EspacamentoW(w: 10),
                    // Altura
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Altura'),
                        onChanged: (value){
                           setState(() {
                           
                           altura = double.parse(value);
                           });

                          },
                      ),
                    ),
                  ],
                ),
                Container(
                width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    resultado = peso / (altura * altura);
                    if(resultado < 18.5){
                      resposta.text = "Abaixo do peso";
                    }else if(resultado >= 18.5 && resultado < 24.9){
                       resposta.text = "Peso normal";
                    }
                    else if(resultado >= 25 && resultado < 29.9){
                       resposta.text = "Sobrepeso";
                    }else if(resultado >= 30 && resultado < 34.9){
                       resposta.text = "Obesidade 1";
                    }
                    else if(resultado >= 35 && resultado < 39.9){
                       resposta.text = "Obesidade 2";
                    }
                     else{
                       resposta.text = "Obesidade 3";
                     }
                  }, child: Text("CALCULAR")),
                ),




                TextField(
                  enabled: false,
                  controller: resposta,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelText: 'RESULTADO'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
