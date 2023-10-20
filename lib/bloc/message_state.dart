import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  final String content;

  MessageState(this.content);

  @override
  List<Object?> get props => [content];
}

class Init extends MessageState {
  Init() : super("dsfdsd");
}

class SetValue extends MessageState {
  final String content;

  SetValue(this.content) : super(content);
}
