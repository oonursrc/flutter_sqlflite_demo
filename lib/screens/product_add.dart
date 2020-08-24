
import 'package:flutter/material.dart';
import 'package:flutter_sqlflite_demo/data/dbHelper.dart';
import 'package:flutter_sqlflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State{

  var dbHelper = new DbHelper();

  var txtName= TextEditingController();
  var txtDescription= TextEditingController();
  var txtUnitPrice= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding:EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildPriceField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }


  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı: "),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması: "),
      controller: txtDescription,
    );
  }



  buildPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı: "),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text("Ekle"),
      onPressed:(){
        addProduct();
      }
    );
  }

  void addProduct() async{
    var result= await dbHelper.insert(new Product(name:txtName.text,description:txtDescription.text, unitPrice:double.tryParse(txtUnitPrice.text)));
    print(
      "Added Product\nName: " + txtName.text +
      "\nDescription: " + txtDescription.text +
      "\nUnit price: " + txtUnitPrice.text +"\n---------------------"
    );
    Navigator.pop(context,true);
  }
}