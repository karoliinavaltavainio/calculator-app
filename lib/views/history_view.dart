import 'package:flutter/material.dart';
import '../controllers/history_database.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: HistoryDatabase.instance.getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No history yet.'));
          }
          final history = snapshot.data!;
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final entry = history[index];
              return ListTile(
                title: Text(entry['calculation']),
                subtitle: Text(entry['timestamp']),
              );
            },
          );
        },
      ),
    );
  }
}
