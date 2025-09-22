// Implement form validation and error handling.
import 'package:flutter/material.dart';

void main() => runApp(FormApp());

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validated Form',
      home: Scaffold(
        appBar: AppBar(title: Text('Validated User Form')),
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
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String gender = 'Male';
  DateTime? dob;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dob = picked;
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) =>
            value == null || value.isEmpty ? 'Enter your first name' : null,
          ),
          TextFormField(
            controller: _middleNameController,
            decoration: InputDecoration(labelText: 'Middle Name'),
            validator: (value) =>
            value == null || value.isEmpty ? 'Enter your middle name' : null,
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) =>
            value == null || value.isEmpty ? 'Enter your last name' : null,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter your email';
              if (!value.contains('@') || !value.contains('.')) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) =>
            value == null || value.length < 6 ? 'Minimum 6 characters' : null,
          ),
          DropdownButtonFormField<String>(
            value: gender,
            decoration: InputDecoration(labelText: 'Gender'),
            items: ['Male', 'Female', 'Other']
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (value) => setState(() => gender = value!),
          ),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              hintText: dob == null
                  ? 'Select your DOB'
                  : '${dob!.day}/${dob!.month}/${dob!.year}',
            ),
            onTap: () => _selectDate(context),
            validator: (value) =>
            dob == null ? 'Please select your date of birth' : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form Submitted Successfully')),
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
