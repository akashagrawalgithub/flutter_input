import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _loginpagekey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final password = TextEditingController();
  final _number = TextEditingController();
  final _phone = TextEditingController();

  String? _radiobutton;
  List<String> _checkbox = [];
  bool _switch = true;
  String? selectedOption;
  File? selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    password.dispose();
    _number.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_loginpagekey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String pass = password.text;
      String number = _number.text;
      String phone = _phone.text;

      print(name);
      print(email);
      print(pass);
      print(number);
      print(phone);
      print(_radiobutton);
      print(_checkbox);
      print(selectedOption);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF65648B),
              Color.fromRGBO(10, 10, 11, 0.10),
            ],
          )),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _loginpagekey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text(
                        "All input tag in the flutter",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            labelText: "Enter your name here",
                            hintText: "Enter your name",
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white60,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: "Enter your email",
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password likh betichod";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          maxLength: 2,
                          controller: _number,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your 12th number",
                            labelText: "12th number",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: const Icon(
                              Icons.school,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "phone number lihk betichod";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your phone number",
                            labelText: "Phone",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Select your gender",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white60),
                            ),
                          ],
                        ),
                        RadioListTile<String>(
                          title: Text("Male",
                              style: TextStyle(color: Colors.white70)),
                          value: "admii",
                          groupValue: _radiobutton,
                          onChanged: (value) {
                            setState(
                              () {
                                _radiobutton = value;
                              },
                            );
                          },
                        ),
                        RadioListTile(
                          title: const Text("Female",
                              style: TextStyle(color: Colors.white70)),
                          value: "Aurat",
                          groupValue: _radiobutton,
                          onChanged: (value) {
                            setState(
                              () {
                                _radiobutton = value;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Select your hobbies",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CheckboxListTile(
                          title: Text(
                            "First",
                            style: TextStyle(color: Colors.white70),
                          ),
                          value: _checkbox.contains("First"),
                          onChanged: (value) {
                            setState(
                              () {
                                if (value == true) {
                                  _checkbox.add("First");
                                } else {
                                  _checkbox.remove("First");
                                }
                              },
                            );
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Second",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          value: _checkbox.contains("Second"),
                          onChanged: (value) {
                            setState(
                              () {
                                if (value == true) {
                                  _checkbox.add("Second");
                                } else {
                                  _checkbox.remove("Second");
                                }
                              },
                            );
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Third",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          value: _checkbox.contains("third"),
                          onChanged: (value) {
                            setState(
                              () {
                                if (value == true) {
                                  _checkbox.add("third");
                                } else {
                                  _checkbox.remove("third");
                                }
                              },
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Are you a student?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                )),
                            Switch(
                              value: _switch,
                              onChanged: (value) {
                                setState(() {
                                  _switch = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Select Your Year",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70,
                                )),
                            DropdownButton<String>(
                              value: selectedOption,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedOption = newValue!;
                                });
                              },
                              items: <String>[
                                "First",
                                "Second",
                                "Third"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text('Select any option'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _pickImage,
                            child: Text('Select Image'),
                          ),
                        ),
                        if (selectedImage != null) Image.file(selectedImage!),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
