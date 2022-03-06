part of fab_app;

class BaseRender extends BaseContext implements IRender {
  @override
  Widget renderInput({
    required BuildContext context,
    required IProperty<String> property,
    String? labelText,
    String? hintText,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    required AsyncSnapshot<String?> snapshot,
  }) {
    final maxLength = property is IMaxLenght ? (property as IMaxLenght).maxLength : null;

    return TextField(
      controller: controller,
      onChanged: property.setter,
      onSubmitted: (value) => FocusScope.of(context).nextFocus(),
      focusNode: HandleFocusNode.handle(isReadOnly: property.isReadOnly),
      textInputAction: TextInputAction.next,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: false,
      style: TextStyle(fontSize: 20),
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText ?? property.label,
        hintText: hintText ?? property.hint,
        errorText: snapshot.error?.toString(),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget renderDropdown<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? hintText,
    required AsyncSnapshot snapshot,
  }) {
    const TextStyle style = TextStyle(fontSize: 20.0);

    return StreamBuilder<List<T>?>(
        stream: datasource.stream,
        builder: (context, snapshotDS) {
          final items = (snapshotDS.data ?? [])
              .map(
                (entry) => DropdownMenuItem<T>(
                  value: entry,
                  child: Text(
                    entry.toString(),
                    style: style,
                  ),
                ),
              )
              .toList();

          return UiRoudedContainer(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButton<T>(
                    value: snapshot.data,
                    onChanged: property.setter,
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
        });
  }

  @override
  Widget renderSelector<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? hintText,
    required AsyncSnapshot snapshot,
  }) {
    return StreamBuilder<List<T>?>(
        stream: datasource.stream,
        builder: (context, snapshotDS) {
          return DropdownSearch<T>(
            selectedItem: snapshot.data,
            onChanged: property.setter,
            items: snapshotDS.data ?? [],
            focusNode: HandleFocusNode.handle(isReadOnly: property.isReadOnly),
            dropdownSearchBaseStyle: const TextStyle(fontSize: 20),
            dropdownSearchDecoration: InputDecoration(
              labelText: hintText ?? property.label,
              errorText: snapshot.error?.toString(),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        });
  }

  @override
  Widget renderSwitch({
    required BuildContext context,
    required IProperty<bool> property,
    String? hintText,
    required AsyncSnapshot<bool?> snapshot,
  }) {
    return SwitchListTile(
      value: snapshot.data ?? false,
      onChanged: property.setter,
      title: Text(
        hintText ?? property.label ?? XString.empty,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      subtitle: snapshot.hasError
          ? Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.red),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            )
          : Container(),
    );
  }

  @override
  Widget renderButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        primary: ui.sty.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: ui.sty.ofText.headline6!.copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Widget renderCard({
    required Widget child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return Card(
      margin: margin,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 8,
      child: Container(
        padding: padding,
        child: child,
      ),
    );
  }

  @override
  Widget renderContainer({
    required Widget child,
  }) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: child,
    );
  }

  @override
  Widget renderGroupCard({
    required IconData iconData,
    double? iconSize,
    required String header,
    String? subHeader,
    required List<Widget> children,
  }) {
    return renderCard(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                iconData,
                size: iconSize,
              ),
              title: Text(header),
              subtitle: Text(subHeader ?? XString.empty),
            ),
            Column(
              children: children,
            )
          ],
        ),
      ),
    );
  }
}
