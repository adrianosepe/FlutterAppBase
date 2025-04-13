part of fab_rx;

class UiAvatarField extends UiField<String, ImageProperty> {
  final String? hintText;

  const UiAvatarField({
    Key? key,
    required ImageProperty property,
    this.hintText,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<String?> snapshot) {
    return const CircleAvatar(
      radius: 50.0,
      backgroundColor: Color(0xFF778899),
      backgroundImage: AssetImage('assets/images/user.png'),
    );
  }
}
