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




























// // containing middle,last and dob fields
// import 'package:flutter/material.dart';

// void main() => runApp(FormApp());

// class FormApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Input Form',
//       home: Scaffold(
//         appBar: AppBar(title: Text('User Input Form')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: UserForm(),
//         ),
//       ),
//     );
//   }
// }

// class UserForm extends StatefulWidget {
//   @override
//   _UserFormState createState() => _UserFormState();
// }

// class _UserFormState extends State<UserForm> {
//   final _formKey = GlobalKey<FormState>();
//   String gender = 'Male';
//   DateTime? dob;

//   // Function to show date picker
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2000),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != dob) {
//       setState(() {
//         dob = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           // First Name
//           TextFormField(
//             decoration: InputDecoration(labelText: 'First Name'),
//             validator: (value) =>
//             value == null || value.isEmpty ? 'Enter your first name' : null,
//           ),

//           // Middle Name
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Middle Name'),
//             validator: (value) =>
//             value == null || value.isEmpty ? 'Enter your middle name' : null,
//           ),

//           // Last Name
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Last Name'),
//             validator: (value) =>
//             value == null || value.isEmpty ? 'Enter your last name' : null,
//           ),

//           // Email
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Email'),
//             keyboardType: TextInputType.emailAddress,
//             validator: (value) =>
//             value == null || !value.contains('@') ? 'Enter a valid email' : null,
//           ),

//           // Password
//           TextFormField(
//             decoration: InputDecoration(labelText: 'Password'),
//             obscureText: true,
//             validator: (value) =>
//             value == null || value.length < 6 ? 'Minimum 6 characters' : null,
//           ),

//           // Gender Dropdown
//           DropdownButtonFormField<String>(
//             value: gender,
//             decoration: InputDecoration(labelText: 'Gender'),
//             items: ['Male', 'Female', 'Other']
//                 .map((g) => DropdownMenuItem(value: g, child: Text(g)))
//                 .toList(),
//             onChanged: (value) => setState(() => gender = value!),
//           ),

//           // Date of Birth Field
//           TextFormField(
//             readOnly: true,
//             decoration: InputDecoration(
//               labelText: 'Date of Birth',
//               hintText: dob == null
//                   ? 'Select your DOB'
//                   : '${dob!.day}/${dob!.month}/${dob!.year}',
//             ),
//             onTap: () => _selectDate(context),
//             validator: (value) =>
//             dob == null ? 'Please select your date of birth' : null,
//           ),

//           // Submit Button
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Form Submitted Successfully')),
//                 );
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }

 
