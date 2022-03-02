part of fab_rx;

class UiDropdownField<TValue> extends UiPrimitiveField<TValue> {
  static const TextStyle style = TextStyle(fontSize: 20.0);

  final Map<TValue, String> options;
  final String? hintText;

  const UiDropdownField({
    Key? key,
    required property,
    required this.options,
    this.hintText,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<TValue?> snapshot) {
    final items = this
        .options
        .entries
        .map(
          (entry) => DropdownMenuItem<TValue>(
            value: entry.key,
            child: Text(
              entry.value,
              style: style,
            ),
          ),
        )
        .toList();

    return UiRoudedContainer(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: DropdownButton<TValue>(
              value: snapshot.data,
              onChanged: this.property.setter,
              iconSize: 48,
              items: items,
              isExpanded: true,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
