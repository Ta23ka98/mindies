import 'package:flutter/material.dart';
import 'package:mindies/add_content/add_content_model.dart';
import 'package:provider/provider.dart';

class AddContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddContentModel>(
      create: (_) => AddContentModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("コンテンツを追加"),
        ),
        body: Center(
          child: Consumer<AddContentModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'タイトル'),
                    onChanged: (text){
                      model.title = text;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '著者'),
                    onChanged: (text){
                      model.author = text;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.addContent();
                          Navigator.of(context).pop(true);
                        } catch(e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      child: Text("追加する"))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
