import 'package:flutter/material.dart';

// mixin StateMixin<S extends StatefulWidget> on State<S> {
mixin StateMixin<S extends StatefulWidget> {
  void check({
    required String? title,
    required String? content,
    Function? function,
  }) {}
}
