part of 'search_countrie_screen.dart';
class _InputSearchScreen extends StatelessWidget {
  const _InputSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: Theme.of(context).textTheme.displayMedium,
          decoration: InputDecoration(
            hintText: 'Introduce una dirección',
            hintStyle: Theme.of(context).textTheme.displayMedium,
            fillColor: Colors.white,
            suffixIconColor: Colors.white,
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.edit_location_alt_rounded),
          ),
          onChanged: (value) {
              context.read<PlacesBloc>().add(GetPlacesEvent(query: value));
          },
        ),
      ),
    );
  }
}