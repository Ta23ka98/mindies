import 'package:flutter/material.dart';
import 'package:mindies/add_content/add_content_page.dart';
import 'package:mindies/content_list/content_list_model.dart';
import 'package:mindies/domain/content.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContentListModel>(
      create: (_) => ContentListModel()..fetchContentList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Indies Miner"),
        ),
        body: Center(
          child: Consumer<ContentListModel>(builder: (context, model, child) {
            final List<Book>? books = model.books;

            if (books == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                  ),
                )
                .toList();
            return ListView(children: widgets);
          }),
        ),
        floatingActionButton: Consumer<ContentListModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () async {
                final bool? added = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddContentPage(),
                    fullscreenDialog: true,
                  ),
                );

                if (added != null && added) {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("追加しました"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                model.fetchContentList();
              },
              tooltip: "Increment",
              child: Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}
