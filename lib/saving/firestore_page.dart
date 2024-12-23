import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({super.key});

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  final CollectionReference product =
  FirebaseFirestore.instance.collection('ab_textcontroller');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore'),
      ),
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (streamSnapshot.hasError) {
            return Center(child: Text('Error: ${streamSnapshot.error}'));
          }
          if (streamSnapshot.hasData && streamSnapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];

                // inputcontroller 데이터를 문자열로 변환
                final String inputText =
                documentSnapshot['inputcontroller'].toString();
                final String keywordText =
                    documentSnapshot['keywordcontroller'] ?? 'No Keyword';

                return Card(
                  child: ListTile(
                    title: Text(inputText),
                    subtitle: Text(keywordText),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No Data Found'));
        },
      ),
    );
  }
}
