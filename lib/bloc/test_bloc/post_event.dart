import 'package:bloc_project_1/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostEvent {
  PostEvent();
  // @override
  // List<Object?> get props => [];
}

class LoadPostsEvent extends PostEvent {}

