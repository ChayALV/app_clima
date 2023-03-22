part of 'search_countrie_screen.dart';

class _AppBarSearchSreen extends StatelessWidget {
  const _AppBarSearchSreen({
    super.key,
    required this.funtion,
  });

  final VoidCallback funtion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: funtion,
          child: SvgPicture.asset("assets/foggy.svg")
        )
      ],
    );
  }
}