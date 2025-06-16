import 'package:flutter/material.dart';

class AppSettingPage extends StatelessWidget {
  const AppSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          AppListTile(title: 'Language', onTap: () {}),
          AppListTile(title: 'Theme', onTap: () {}),
        ],
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.trailing,
    required this.title,
    required this.onTap,
  });

  final Widget? trailing;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
