import 'package:college/fourth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 class ThirdPage extends StatefulWidget {
   const ThirdPage({super.key});

   @override
   State<ThirdPage> createState() => _ThirdPageState();
 }

 class _ThirdPageState extends State<ThirdPage> {
   @override
   final _formKey = GlobalKey<FormState>();

   // Store selected radio button value
   String? _category;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("Book details")),
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Form(
           key: _formKey,
           child: Column(
             children: [

               // Name Field
               TextFormField(
                 decoration: InputDecoration(labelText: "Name"),
                 inputFormatters: [
                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                 ],
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return "Please enter name";
                   }
                   return null;
                 },
               ),

               // Subject Field
               TextFormField(
                 decoration: InputDecoration(labelText: "Subject"),
                 inputFormatters: [
                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                 ],
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return "Please enter subject";
                   }
                   return null;
                 },
               ),

               // Category (Radio buttons)
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0),
                 child: Row(
                   children: [
                     Text("Category: "),
                     Radio<String>(
                       value: 'TW',
                       groupValue: _category,
                       onChanged: (value) {
                         setState(() {
                           _category = value;
                         });
                       },
                     ),
                     Text('TW'),
                     Radio<String>(
                       value: 'IA',
                       groupValue: _category,
                       onChanged: (value) {
                         setState(() {
                           _category = value;
                         });
                       },
                     ),
                     Text('IA'),
                     Radio<String>(
                       value: 'Or',
                       groupValue: _category,
                       onChanged: (value) {
                         setState(() {
                           _category = value;
                         });
                       },
                     ),
                     Text('Or'),
                   ],
                 ),
               ),

               // Marks Field
               TextFormField(
                 decoration: InputDecoration(labelText: "Marks"),
                 keyboardType: TextInputType.number,
                 inputFormatters: [
                   FilteringTextInputFormatter.digitsOnly, // only digits (no minus or decimal)
                 ],
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return "Please enter marks";
                   }
                   if (int.tryParse(value)! < 0) {
                     return "Marks can't be negative";
                   }
                   return null;
                 },
               ),

               SizedBox(height: 20),

               // Submit Button
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
               SizedBox(height: 20),
               ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_) => BookApp()));
               }, child: Text('fourth Page'),),
             ],
           ),
         ),
       ),
     );
   }
 }







