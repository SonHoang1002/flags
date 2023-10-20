import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  MessageEvent();

  @override
  List<Object?> get props => [];
}

class SetMessageEvent extends MessageEvent {
  final String value;

  SetMessageEvent(this.value);
  
}
