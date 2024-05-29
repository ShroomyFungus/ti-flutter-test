import 'package:chrconnecthpdraft/feature/home/components/appointments/appointments.dart';
import 'package:chrconnecthpdraft/feature/home/components/inbox/inbox.dart';
import 'package:chrconnecthpdraft/feature/home/components/more_resources.dart';
import 'package:chrconnecthpdraft/feature/home/components/welcoming.dart';
import 'package:flutter/material.dart';

import 'components/reminders/reminders.dart';

class HomeScreen extends StatelessWidget {
  final List<FocusNode>? focusNodes;
  final ScrollController scrollController;
  const HomeScreen(
      {super.key, this.focusNodes, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/background.png'),
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Welcoming(
                  state: WelcomingStates.evening,
                  name: "Linda",
                ),
              ),
              const SizedBox(height: 32),
              Focus(
                  focusNode: focusNodes?[1],
                  child: Reminders(focusNodes: focusNodes)),
              const SizedBox(height: 32),
              Focus(
                  focusNode: focusNodes?[2],
                  child: Appointments(
                    verticalLayout: true,
                    focusNodes: focusNodes!,
                  )),
              const SizedBox(height: 32),
              Focus(
                focusNode: focusNodes?[5],
                child: const Column(
                  children: [
                    Inbox(verticalLayout: true),
                    SizedBox(height: 32),
                    MoreResources(),
                  ],
                ),
              ),
              const SizedBox(height: 88),
            ],
          ),
        ),
      ],
    );
  }
}
