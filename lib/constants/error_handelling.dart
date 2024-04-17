import 'dart:convert';

import 'package:ec/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucess,
}) {
  switch (response.statusCode) {
    case 200:
      onSucess();
      break;

    case 400:
      ShowSnackbar(context, jsonDecode(response.body)['msg']);
      break;

    case 500:
      ShowSnackbar(context, jsonDecode(response.body)['msg']);
      break;

    default:
      ShowSnackbar(context, jsonDecode(response.body));
  }
}
