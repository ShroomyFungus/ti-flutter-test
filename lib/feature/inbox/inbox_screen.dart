import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.localizations.inbox, style: Theme.of(context).textTheme.labelLarge,));
  }
}
