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
    bool obscureText = false,
    String obscuringCharacter = '*',
    TextAlign textAlign = TextAlign.left,
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
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      style: TextStyle(fontSize: 20),
      textAlign: textAlign,
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
    String? labelText,
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

        return ui.render.renderContainer(
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
      },
    );
  }

  @override
  Widget renderSelector<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? labelText,
    String? hintText,
    bool isSearchable = true,
    required AsyncSnapshot snapshot,
  }) {
    return StreamBuilder<List<T>?>(
      stream: datasource.stream,
      builder: (context, snapshotDS) {
        return DropdownSearch<T>(
          selectedItem: snapshot.data,
          onChanged: property.setter,
          items: snapshotDS.data ?? <T>[],
          mode: Mode.BOTTOM_SHEET,
          showSearchBox: isSearchable,
          focusNode: HandleFocusNode.handle(isReadOnly: property.isReadOnly),
          showAsSuffixIcons: false,
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?.toString() ?? XString.empty, style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20)),
          dropdownSearchBaseStyle: const TextStyle(fontSize: 20),
          dropdownSearchDecoration: InputDecoration(
            labelText: labelText ?? property.label,
            hintText: hintText ?? property.hint,
            errorText: snapshot.error?.toString(),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget renderSwitch({
    required BuildContext context,
    required IProperty<bool> property,
    String? labelText,
    required AsyncSnapshot<bool?> snapshot,
  }) {
    return SwitchListTile(
      value: snapshot.data ?? false,
      onChanged: property.setter,
      title: Text(
        labelText ?? property.label ?? XString.empty,
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
  Widget renderCheckbox({
    required BuildContext context,
    required IProperty<bool> property,
    String? labelText,
    required AsyncSnapshot<bool?> snapshot,
    TextStyle? checkedTextStyle,
    TextStyle? uncheckedTextStyle,
  }) {
    final style = property.value ?? false
        ? checkedTextStyle ?? TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        : uncheckedTextStyle ?? TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFEE3126));

    return Row(
      children: [
        Expanded(
          child: Text(
            labelText ?? property.label ?? XString.empty,
            style: style,
          ),
        ),
        Checkbox(
          value: snapshot.data ?? false,
          onChanged: property.setter,
        )
      ],
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
          side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.black45),
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
