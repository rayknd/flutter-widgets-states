import 'package:flutter/material.dart';
import 'package:widgets_state/language.dart';

class ListLanguages extends StatefulWidget {
  const ListLanguages({super.key});

  @override
  State<ListLanguages> createState() => _ListLanguagesState();
}

class _ListLanguagesState extends State<ListLanguages> {
  List<Language> linguagens = [];

  List<ChoiceChip> _buildChips() {
    return linguagens
        .map((language) => ChoiceChip(
            label: Text(language.name),
            selected: language.selected,
            onSelected: (bool value) => setState(() {
                  language.selected = value;
                })))
        .toList();
  }

  List<Card> _buildCards() {
    return linguagens.where((language) => language.selected).map((language) {
      return Card(
        child: ListTile(
          leading: language.icon,
          title: Text(language.name),
          subtitle: Text(language.description),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Future future = Navigator.pushNamed(context, "/add");
                future.then((language) {
                  setState(() {
                    linguagens.add(language);
                  });
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Wrap(
              spacing: 10,
              children: _buildChips(),
            ),
          ),
          Expanded(
              child: ListView(
            children: _buildCards(),
          ))
        ],
      ),
    );
  }
}
