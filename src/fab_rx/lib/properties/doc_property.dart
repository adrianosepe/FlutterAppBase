part of fab_rx;

class CpfProperty extends StringProperty {
  CpfProperty({
    String? hint,
    bool isRequired = false,
  }) : super(
          hint: hint,
          isRequired: isRequired,
        );
}

class DocProperty extends StringProperty {
  DocProperty({
    String? hint,
    bool isRequired = false,
  }) : super(
          hint: hint,
          isRequired: isRequired,
        );
}
