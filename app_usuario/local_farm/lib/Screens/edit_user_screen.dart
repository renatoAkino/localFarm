import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:localfarm/Models/user_model.dart';
import 'package:localfarm/Screens/home_screen.dart';
import 'package:localfarm/widgets/home_appBar.dart';
import 'package:scoped_model/scoped_model.dart';

class EditUserScreen extends StatefulWidget {
  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _cepController = TextEditingController();
  final _adressController = TextEditingController();
  final _adressComplementController = TextEditingController();
  final _birthController = TextEditingController();
  String _genderText;
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();

    initialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading){
            return Center(child: CircularProgressIndicator());
          }
          else {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(height: 20,),
                       Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(labelText: "Nome Completo"),
                                validator: (text) {
                                  if (text.isEmpty ) {
                                    return "Nome inválido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _cepController,
                                decoration: InputDecoration(labelText: "CEP"),
                                onChanged: (text) {

                                },
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return "CEP inválido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _adressController,
                                decoration: InputDecoration(labelText: "Endereço"),
                                onChanged: (text) {

                                },
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return "Endereço inválido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _adressComplementController,
                                decoration: InputDecoration(labelText: "Complemento"),
                                onChanged: (text) {

                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _birthController,
                                decoration: InputDecoration(labelText: "Data de Nascimento"),
                                onTap: (){
                                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1920), lastDate: DateTime.now()).then(
                                          (date){
                                            model.setBirth(date);
                                            _birthController.text = formatDate(date, [ dd , '/' , mm , '/', yyyy]);
                                          }
                                          );
                                },
                                validator: (text) {
                                  if (text.isEmpty) {
                                    return "Endereço inválido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              DropdownButton<String>(
                                hint: Text("Sexo"),
                                isExpanded: true,
                                underline: Container( height: 2, color: Colors.grey[350],),
                                value: _genderText,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _genderText = newValue;
                                  });
                                },
                                items: <String>['Maculino', 'Feminino', 'LGBTQI', 'Não especificar']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 16,
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                        SizedBox(
                            height: 40,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              textColor: Colors.white,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              child: Text(
                                "Salvar",
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              onPressed: () {
                                if(_formKey.currentState.validate()){
                                  Map<String, dynamic> userData = Map();

                                  userData['name'] = _nameController.text;
                                  userData['cep'] = _cepController.text;
                                  userData['adress'] = _adressController.text;
                                  userData['adress_complement'] = _adressComplementController.text;
                                  userData['gender'] = _genderText;

                                  model.updateUserData(userData: userData, onSucess: onSucess, onFailed: onFailed);

                                }

                              }
                              ,

                            )),

                      ],
                    )),
              ),
            );
          }
        },
      ),
    );
  }

  void initialValues() {
    Timestamp timestamp = UserModel.of(context).userData['birth'];
    print(UserModel.of(context).userData['birth'].toString());
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    _cepController.text = UserModel.of(context).userData['cep'];
    _adressController.text = UserModel.of(context).userData['adress'];
    _adressComplementController.text = UserModel.of(context).userData['adress_complement'];
    _birthController.text = formatDate(date, [ dd , '/' , mm , '/', yyyy]);
    //_genderText = UserModel.of(context).userData['gender'];
    _nameController.text = UserModel.of(context).userData['name'];
  }

  void onSucess(){
    Navigator.of(context).pop(context);
  }

  void onFailed(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Falha ao alterar dados", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 3),

        ));

  }
}
