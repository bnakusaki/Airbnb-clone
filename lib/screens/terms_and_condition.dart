import 'package:airbnb/shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                child: Image.asset(
                  Assets.airbnbLogo,
                  height: 40,
                ),
              ),
              Text(
                l10n.commnityCommitmentSheetTitle,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  l10n.msg10,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 30, height: 1.2),
                ),
              ),
              Text(
                l10n.msg11,
                style:
                    Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  l10n.msg12,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  l10n.learnMoreButtonLabel,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.scrim),
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {},
                child: Text(l10n.agreeAndContinueButtonLabel),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    l10n.declineButtonLabel,
                    style: TextStyle(color: Theme.of(context).colorScheme.scrim),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
