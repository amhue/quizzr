import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String data;
  const TitleLarge({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.titleLarge);
  }
}

class TitleSmall extends StatelessWidget {
  final String data;
  const TitleSmall({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.titleSmall);
  }
}

class BodyText extends StatelessWidget {
  final String data;
  const BodyText({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class DescText extends StatelessWidget {
  final String data;
  const DescText({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.bodySmall);
  }
}
