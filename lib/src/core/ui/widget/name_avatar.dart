import 'package:flutter/material.dart';
import 'package:doti_starter/index.dart';

class NameAvatar extends StatelessWidget {
  const NameAvatar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: IconSizes.avatar,
      width: IconSizes.avatar,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.65),
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: FontSizes.label,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ),
    );
  }
}
