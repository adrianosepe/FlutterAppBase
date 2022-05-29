library fab_rx;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:fab_app/fab_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:rxdart/rxdart.dart';

import 'package:fab_lib/fab_lib.dart';

part 'blocs/data/transformers.dart';
part 'blocs/data/normalizer.dart';
part 'blocs/bloc_provider.dart';
part 'blocs/bloc.dart';
part 'blocs/form.dart';

part 'events/stream_set_state.dart';

part 'common/input_formatters/edoc_type.dart';

part 'properties/validators/docs/cnpj.dart';
part 'properties/validators/docs/cpf.dart';
part 'properties/validators/model_validators.dart';
part 'properties/validators/validation_result.dart';

part 'properties/collection_property.dart';
part 'properties/custom_property.dart';
part 'properties/doc_property.dart';
part 'properties/midia_property.dart';
part 'properties/personal_property.dart';
part 'properties/primitive_property.dart';
part 'properties/property.dart';

part 'widgets/container/card.dart';
part 'widgets/container/group_card.dart';
part 'widgets/container/container.dart';
part 'widgets/inputs/base/field.dart';
part 'widgets/inputs/base/primitive_field.dart';
part 'widgets/inputs/geo/zipcode_field.dart';
part 'widgets/inputs/id/doc_field.dart';
part 'widgets/inputs/id/plate_field.dart';
part 'widgets/inputs/media/avatar_field.dart';
part 'widgets/inputs/option/bool_field.dart';

part 'widgets/inputs/person/email_field.dart';
part 'widgets/inputs/person/name_field.dart';
part 'widgets/inputs/person/phone_field.dart';

part 'widgets/inputs/primitive/date_field.dart';
part 'widgets/inputs/primitive/mask_field.dart';
part 'widgets/inputs/primitive/number_field.dart';
part 'widgets/inputs/primitive/string_field.dart';
part 'widgets/inputs/selection/dropdown_field.dart';
part 'widgets/inputs/selection/selector_field.dart';
