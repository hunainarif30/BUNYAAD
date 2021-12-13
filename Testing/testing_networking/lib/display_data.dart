// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names, annotate_overrides

import 'package:flutter/material.dart';
import 'package:testing_networking/photo_album.dart';
import 'package:testing_networking/model.dart';

class display_album extends StatefulWidget {
  const display_album({Key? key}) : super(key: key);

  @override
  _display_albumState createState() => _display_albumState();
}

class _display_albumState extends State<display_album> {
  late Future<photo_album> futurephoto_album;
  @override
  void initState() {
    super.initState();
    futurephoto_album = fetchphoto_album();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<photo_album>(
          future: futurephoto_album,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
