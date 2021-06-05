import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

class Property<TValue> {
  final BehaviorSubject<TValue> subject = BehaviorSubject<TValue>();
  final StreamTransformer<TValue, TValue> transformer;

  final bool isRequired;

  Property({
    this.transformer,
    TValue value,
    this.isRequired = false,
    this.isReadOnly = false,
  }) {
    this.value = value;
  }

  TValue get value => subject.value;
  set value(TValue newValue) => subject.value = newValue;

  bool isReadOnly;

  Function(TValue) get setter => subject.sink.add;

  Stream<TValue> get stream {
    if (transformer == null) {
      return subject.stream;
    }

    return subject.stream.transform(transformer);
  }

  bool exists() => value != null;
  bool isNull() => value == null;

  close() {
    subject.close();
  }
}

class CpfProperty extends StringProperty {
  CpfProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);
}

class DocProperty extends StringProperty {
  DocProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);
}

class DateTimeProperty extends StringProperty {
  DateTimeProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);
}

class LocationProperty extends Property<LocationData> {
  String get state => this.value?.state;
  String get city => this.value?.city;

  LocationProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);

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
  String get brand => this.value?.brand;
  String get model => this.value?.model;

  DeviceTypeProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);

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

class StringProperty extends Property<String> {
  StringProperty({
    transformer,
    value,
    isRequired,
  }) : super(
          transformer: transformer,
          value: value,
          isRequired: isRequired,
        );
}

class IntProperty extends Property<int> {
  IntProperty({
    transformer,
    value,
    isRequired,
  }) : super(
          transformer: transformer,
          value: value,
          isRequired: isRequired,
        );
}

class DoubleProperty extends Property<double> {
  DoubleProperty({
    transformer,
    value,
    isRequired,
  }) : super(
          transformer: transformer,
          value: value,
          isRequired: isRequired,
        );
}

class ImageProperty extends Property<String> {
  static const image_base64 = 'data:image/png;base64';

  ImageProperty({
    bool isRequired = false,
  }) : super(isRequired: isRequired);

  Uint8List read() {
    if (!exists()) {
      return null;
    }

    return base64.decode(value.substring(value.indexOf(',') + 1));
  }

  void write(Uint8List bytes) {
    String img64 = base64Encode(bytes);

    setter('$image_base64, $img64');
  }
}

class LocationData {
  String state;
  String city;

  LocationData({this.state, this.city});
}

class DeviceTypeData {
  String brand;
  String model;

  DeviceTypeData({this.brand, this.model});
}
