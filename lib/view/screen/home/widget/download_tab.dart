import 'package:flutter/material.dart';

class DownloadTab extends StatefulWidget {
  const DownloadTab({Key? key}) : super(key: key);

  @override
  State<DownloadTab> createState() => _DownloadTabState();
}

class _DownloadTabState extends State<DownloadTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('download tab'),
    );
  }
}
