import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.localizations.appointments, style: Theme.of(context).textTheme.labelLarge,));
  }
}
