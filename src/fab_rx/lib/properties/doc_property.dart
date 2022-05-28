part of fab_rx;

class CpfProperty extends StringProperty {
  CpfProperty({
    String? label,
    String? hint,
    bool isRequired = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
        );
}

class DocProperty extends StringProperty {
  DocProperty({
    String? label,
    String? hint,
    bool isRequired = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
        );
}
