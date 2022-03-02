library fab_lib;

import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import 'package:intl/intl.dart' as intl;

part 'common/async/lazy.dart';
part 'common/async/lazy_async.dart';

part 'common/store/date_time_store_property.dart';
part 'common/store/json_store_property.dart';
part 'common/store/string_store_property.dart';

part 'common/store/key_value_store.dart';

part 'events/delegates.dart';
part 'events/event_args.dart';

part 'helpers/xdatetime.dart';
part 'helpers/xenum.dart';
part 'helpers/xflow.dart';
part 'helpers/xjson.dart';
part 'helpers/xnumber.dart';
part 'helpers/xstring.dart';

part 'models/date/date_range.dart';
part 'models/json/interchangeable.dart';

part 'services/abstraction/iresult.dart';
part 'services/models/enums/eresult_status.dart';
part 'services/models/result_info.dart';
part 'services/result.dart';
part 'services/typed_result.dart';
