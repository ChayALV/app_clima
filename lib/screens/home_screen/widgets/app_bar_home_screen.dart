
part of '../home_screen.dart';

class _AppBarHomeScreen extends StatelessWidget {
  final VoidCallback funtion;
  final String countrieName;
  const _AppBarHomeScreen({
    required this.funtion, 
    required this.countrieName
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              countrieName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: funtion,
          child: SvgPicture.asset("assets/foggy.svg")
        )
      ],
    );
  }
}