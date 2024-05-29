import 'dart:ui';

import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:chrconnecthpdraft/feature/app/theme/app_theme.dart';
import 'package:chrconnecthpdraft/feature/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

/// Main app widget in charge of creating [MaterialApp] along with localization delegates, routes and theme.
class CHRConnectApp extends StatefulWidget {
  const CHRConnectApp({super.key});

  @override
  State<CHRConnectApp> createState() => _CHRConnectAppState();
}

class _CHRConnectAppState extends State<CHRConnectApp> {
  late GlobalKey closeKey;
  ScrollController? scrollController = ScrollController();

  /// List of [FocusNode]s used in onboarding screens.
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    closeKey = GlobalKey();
    super.initState();

    // Generate focus nodes for onboarding screens.
    focusNodes = List<FocusNode>.generate(
      7,
      (int i) => FocusNode(debugLabel: 'Onboarding Focus Node $i'),
      growable: false,
    );
  }

  void showOnboarding() {
    final OnboardingState? onboardingState =
        closeKey.currentState as OnboardingState?;
    onboardingState?.show();
  }

  void closeOnboarding() {
    final OnboardingState? onboardingState =
        closeKey.currentState as OnboardingState?;
    onboardingState?.hide();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.localizations.chr_connect,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        ...const MaterialScrollBehavior().dragDevices
      }),
      home: Onboarding(
        key: closeKey,
        steps: [
          OnboardingStep(
            focusNode: focusNodes[0],
            titleText: 'Hi,\n',
            bodyText: 'We\'ll take you on a quick tour of your homepage.',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            shape: const CircleBorder(),
            overlayShape: const CircleBorder(),
            fullscreen: false,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.minScrollExtent,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
          OnboardingStep(
            focusNode: focusNodes[1],
            titleText: '\nReminders\n',
            bodyText:
                '\nThe first section shows your reminders. If there are any tasks requiring action from you, you\'ll find them here.',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.maxScrollExtent * 0.25,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
          OnboardingStep(
            focusNode: focusNodes[2],
            titleText: '\nUpcoming Appointments\n',
            bodyText:
                '\nThis second section gives you easy access to your upcoming appointments.\n\n',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.maxScrollExtent * 0.3,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
          OnboardingStep(
            focusNode: focusNodes[3],
            titleText: '',
            bodyText:
                'There are direct links to your virtual appointments.\n\n',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.minScrollExtent,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
          OnboardingStep(
            focusNode: focusNodes[4],
            titleText: '',
            bodyText:
                'You can view all your scheduled appointments via this link.',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.maxScrollExtent,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
          OnboardingStep(
            focusNode: focusNodes[5],
            titleText: 'Inbox\n',
            bodyText:
                'At the bottom of the page, you\'ll find your messages and some extra resources.\n\n',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            hasLabelBox: true,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
          ),
          OnboardingStep(
            focusNode: focusNodes[6],
            titleText: 'That\'s all for now! Enjoy your visit.',
            bodyText: '',
            arrowPosition: ArrowPosition.autoVertical,
            overlayColor: AppTheme.colorScheme.tertiary,
            shape: const CircleBorder(),
            overlayShape: const CircleBorder(),
            hasLabelBox: true,
            fullscreen: false,
            textAlign: TextAlign.center,
            showPulseAnimation: true,
            onTapCallback: (area, next, close) {
              scrollController
                  ?.animateTo(
                scrollController!.position.minScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              )
                  .then((value) {
                next();
              });
            },
          ),
        ],
        onChanged: (int index) {
          //close the onboarding when the last step is reached
          if (index >= 7) {
            Future.delayed(Duration.zero, () {
              closeOnboarding();
            });
          }
        },
        child: MainScreen(
          scrollController: scrollController!,
          focusNodes: focusNodes,
          showOnboarding: showOnboarding,
        ),
      ),
      theme: ThemeData(
        colorScheme: AppTheme.colorScheme,
        scaffoldBackgroundColor: AppTheme.colorScheme.background,
        textTheme: AppTheme.textTheme,
        textButtonTheme: AppTheme.textButtonTheme,
        chipTheme: AppTheme.chipTheme,
        iconTheme: AppTheme.iconTheme,
      ),
    );
  }
}
