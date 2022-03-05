part of fab_rx;

class LocationProperty extends Property<LocationData> {
  String? get state => this.value?.state;
  String? get city => this.value?.city;

  LocationProperty({
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
        );

  void update(String state, String city) {
    this.value = LocationData(
      state: state,
      city: city,
    );
  }

  void reset() {
    this.value = LocationData();
  }
}

class DeviceTypeProperty extends Property<DeviceTypeData> {
  String? get brand => this.value?.brand;
  String? get model => this.value?.model;

  DeviceTypeProperty({
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
        );

  void update(String brand, String model) {
    this.value = DeviceTypeData(
      brand: brand,
      model: model,
    );
  }

  void reset() {
    this.value = DeviceTypeData();
  }
}

class LocationData {
  String? state;
  String? city;

  LocationData({this.state, this.city});
}

class DeviceTypeData {
  String? brand;
  String? model;

  DeviceTypeData({this.brand, this.model});
}
