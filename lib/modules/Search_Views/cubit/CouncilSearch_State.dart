import 'package:councils/models/council_model/council_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchCouncilModel> councils;

  SearchLoaded({required this.councils});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
