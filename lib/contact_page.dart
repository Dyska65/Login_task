import 'package:flutter/material.dart';

import 'package:login_task/components/input_field.dart';
import 'package:login_task/components/submit_button.dart';
import 'package:login_task/contact_view_model.dart';
import 'package:login_task/utils/validator.dart';

class ContactScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ContactViewModel _loginViewModel = ContactViewModel();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Contact us",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InputField(
                  hintText: "Name",
                  validator: (text) => Validator.checkName(text),
                  onChanged: (text) => checkValidation(context),
                  controller: nameController,
                ),
                InputField(
                  hintText: "Email",
                  validator: (text) => Validator.checkEmail(text),
                  onChanged: (text) => checkValidation(context),
                  controller: emailController,
                ),
                InputField(
                  hintText: "Message",
                  validator: (text) => Validator.checkEmpty(text),
                  onChanged: (text) => checkValidation(context),
                  controller: messageController,
                ),
                StreamBuilder<StatusButton>(
                  stream: _loginViewModel.statusButtonStream,
                  builder: (BuildContext context, AsyncSnapshot<StatusButton> snapshot) {
                    if (snapshot.data == StatusButton.enabled) {
                      return const SubmitButton(
                        color: Color(0xff737B7D),
                        text: "Submit",
                      );
                    }
                    if (snapshot.data == StatusButton.active) {
                      return SubmitButton(
                        color: const Color(0xff986e8e),
                        text: "Submit",
                        onPress: () async {
                          String response = await _loginViewModel.sendRequest(
                            name: nameController.text,
                            email: emailController.text,
                            message: messageController.text,
                          );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(response)));
                        },
                      );
                    }
                    if (snapshot.data == StatusButton.waiting) {
                      return const SubmitButton(
                        color: Color(0xff986e8e),
                        text: "Please wait",
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkValidation(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      _loginViewModel.setStatusButton(StatusButton.enabled);
      return;
    }
    _loginViewModel.setStatusButton(StatusButton.active);
  }
}
