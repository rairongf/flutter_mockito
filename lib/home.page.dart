import 'package:flutter/material.dart';

import 'home.controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();
  final _formKey = GlobalKey<FormState>();
  num result = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Align(alignment: Alignment.center, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '${controller.arg1}',
                      onChanged: (text){
                        controller.arg1 = int.parse(text);
                      },
                    ),
                    DropdownButtonFormField(
                      onChanged: (Operations? operation){
                        controller.selectedOperation = operation ?? Operations.add;
                      },
                      items: [
                        DropdownMenuItem(child: Text('+'), value: Operations.add,),
                        DropdownMenuItem(child: Text('-'), value: Operations.subtract,),
                        DropdownMenuItem(child: Text('*'), value: Operations.multiply,),
                        DropdownMenuItem(child: Text('/'), value: Operations.divide,),
                      ]),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '${controller.arg2}',
                      onChanged: (text){
                        controller.arg2 = int.parse(text);
                      },
                    ),
                    Text('='),
                    Text('$result'),
                  ],
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      if (_formKey.currentState!.validate()) {
                        num value = controller.calculate();
                        setState(() {
                          result = value;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.green,
                      child: Text('Calcular')
                    )
                  ),
                ),
              ]
            ),
          )
        ),
      )
    );
  }
}