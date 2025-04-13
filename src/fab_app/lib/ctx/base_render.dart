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
      style: const TextStyle(fontSize: 20),
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
              const SizedBox(
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
              const SizedBox(
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
          //items: snapshotDS.data ?? <T>[],
          // mode: Mode.BOTTOM_SHEET,
          // showSearchBox: isSearchable,
          // focusNode: HandleFocusNode.handle(isReadOnly: property.isReadOnly),
          // showAsSuffixIcons: false,
          dropdownBuilder: (context, selectedItem) {
            return Text(
              selectedItem?.toString() ?? XString.empty,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
            );
          },
          // dropdownSearchBaseStyle: const TextStyle(fontSize: 20),
          // dropdownSearchDecoration: InputDecoration(
          //   labelText: labelText ?? property.label,
          //   hintText: hintText ?? property.hint,
          //   errorText: snapshot.error?.toString(),
          //   contentPadding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 3.0),
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          // ),
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
              style: const TextStyle(color: Colors.red),
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
        ? checkedTextStyle ??
            const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        : uncheckedTextStyle ??
            const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFEE3126),
            );

    final hasText = property.label != null;

    return hasText
        ? Row(
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
          )
        : Checkbox(
            value: snapshot.data ?? false,
            onChanged: property.setter,
          );
  }

  @override
  Widget renderButton({
    required BuildContext context,
    required String text,
    VoidCallback? onPressed,
    Color? color,
  }) {
    return renderContainerButton(
      context: context,
      onPressed: onPressed,
      widget: Text(
        text,
        style: ui.sty.ofText.titleLarge!.copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Widget renderContainerButton({
    required BuildContext context,
    required Widget widget,
    VoidCallback? onPressed,
    Color? color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: color ?? ui.sty.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      onPressed: onPressed,
      child: widget,
    );
  }

  @override
  Widget renderAnimatedButton({
    required BuildContext context,
    required String text,
    ActionControllerCallback? onPressed,
    Color? color,
  }) {
    return AnimatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: ui.sty.ofText.titleLarge!.copyWith(color: Colors.white),
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
      decoration: const ShapeDecoration(
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
