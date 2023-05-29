// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:notes/src/features/domain.dart';

class HomeList extends Equatable {
  final int total;
  final List<Home> data;
  HomeList({
    int? total,
    List<Home>? data,
  })  : total = total ?? 0,
        data = data ?? [];

  @override
  List<Object> get props => [total, data];
}
