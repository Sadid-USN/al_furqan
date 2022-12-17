import 'package:flutter/material.dart';
import '../widgets/surahs_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text('Al-Furqan'),
          centerTitle: true,
        ),
        body: const SurahsListWidget());
  }
}
