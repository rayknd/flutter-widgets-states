import 'package:flutter/material.dart';
import 'package:widgets_state/language.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  // ignore: non_constant_identifier_names
  final _FormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome", label: Text("Nome")),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o nome";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Descrição", label: Text("Descrição")),
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a descrição";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                    onPressed: () {
                      if (_FormKey.currentState!.validate()) {
                        Language language = Language(_nameController.text,
                            _descriptionController.text, Icon(Icons.android));

                        Navigator.pop(context, language);
                      }
                    },
                    child: const Text("Salvar")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
