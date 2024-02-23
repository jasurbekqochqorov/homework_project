import 'package:flutter/material.dart';
import 'package:homework12/data/local/storage_repository.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Empty:${StorageRepository.getString(key:'name')}'),),
    );
  }
}
