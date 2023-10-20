// import 'package:equatable/equatable.dart';

// class PostState{
//   // final int timeDuration;

//   // PostState(this.timeDuration);
//   // @override
//   // List<Object?> get props => [];
// }

import 'package:bloc_project_1/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostState {
  final List<Post> listDate;
  PostState(this.listDate);

  @override
  List<Object?> get props => [];
}

class LoadingPostsState extends PostState {
  LoadingPostsState():super([]);
  // LoadingPostsState():super();
}

class LoadedPostsState extends PostState {
  List<Post> list;
  LoadedPostsState(this.list) : super(list);
}

class ErrorPostsState extends PostState {
  Object error;
  ErrorPostsState(this.error) : super([]);
}
