library fab_app;

import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fab_app/ui/interaction/selection_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart' as ft;

import 'package:fab_lib/fab_lib.dart';
import 'package:gap/gap.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

part 'ctx/abstractions/ienvironment.dart';
part 'ctx/abstractions/ihdi.dart';
part 'ctx/abstractions/ilayout.dart';
part 'ctx/abstractions/inavigation.dart';
part 'ctx/abstractions/irender.dart';
part 'ctx/abstractions/istyle.dart';
part 'ctx/abstractions/iui_settings.dart';

part 'ctx/base_context.dart';
part 'ctx/base_environment.dart';
part 'ctx/base_hdi.dart';
part 'ctx/base_layout.dart';
part 'ctx/base_navigation.dart';
part 'ctx/base_render.dart';
part 'ctx/base_style.dart';
part 'ctx/base_ui_settings.dart';

part 'models/enums/eapp_action.dart';
part 'models/enums/etake_picture.dart';
part 'models/enums/ebutton_state.dart';
part 'models/enums/etoast_type.dart';
part 'models/icon_option.dart';
part 'models/option.dart';

part 'rx/iproperty.dart';
part 'rx/behaviors/imaxlength.dart';

part 'services/models/ientity_base.dart';
part 'services/entity_web_api_service.dart';

part 'ui/common/handle_focus_node.dart';

part 'ui/interaction/message_dialog.dart';

part 'ui/widgets/empty_content.dart';
part 'ui/widgets/base/view.dart';
part 'ui/widgets/buttons/animated_button.dart';
part 'ui/widgets/buttons/async_button.dart';
part 'ui/widgets/containers/icon_rouded_container.dart';
part 'ui/widgets/containers/rouded_container.dart';
