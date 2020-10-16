import 'package:ParkA/data/data_models/message/message_data_model.dart';

class Chat {
  String id;
  String receiverId;
  String senderId;
  String reservationId;
  List<Message> messages;

  Chat({
    this.id,
    this.receiverId,
    this.reservationId,
    this.senderId,
  });
}
