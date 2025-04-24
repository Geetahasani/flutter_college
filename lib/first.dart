import 'package:college/second.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: bookNameController,
                  label: "Book Name",
                  validator: _validateTextOnly,
                ),
                _buildTextField(
                  controller: authorController,
                  label: "Author",
                  validator: _validateTextOnly,
                ),
                _buildTextField(
                  controller: priceController,
                  label: "Price",
                  keyboardType: TextInputType.number,
                  validator: _validateNonNegativeNumber,
                ),
                _buildTextField(
                  controller: quantityController,
                  label: "Quantity",
                  keyboardType: TextInputType.number,
                  validator: _validateNonNegativeNumber,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted Successfully')),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> SecondPage()));
                  }, child: Center(child: Text('Second Page'),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  String? _validateTextOnly(String? value) {
    if (value == null || value.isEmpty) return 'This field cannot be empty';
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Only alphabets are allowed';
    }
    return null;
  }

  String? _validateNonNegativeNumber(String? value) {
    if (value == null || value.isEmpty) return 'This field cannot be empty';
    final number = double.tryParse(value);
    if (number == null || number < 0) {
      return 'Enter a non-negative number';
    }
    return null;
  }
}
