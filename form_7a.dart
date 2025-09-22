 // Design a form with various input fields.
import 'package:flutter/material.dart';

void main() => runApp(FormApp());

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Form Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('User Input Form')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserForm(),
        ),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          // Name Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) =>
            value == null || value.isEmpty ? 'Enter your name' : null,
          ),

          // Email Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
            value == null || !value.contains('@') ? 'Enter a valid email' : null,
          ),

          // Password Field
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) =>
            value == null || value.length < 6 ? 'Minimum 6 characters' : null,
          ),

          // Gender Dropdown
          DropdownButtonFormField<String>(
            value: gender,
            decoration: InputDecoration(labelText: 'Gender'),
            items: ['Male', 'Female', 'Other']
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (value) => setState(() => gender = value!),
          ),

          // Submit Button
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form Submitted')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
