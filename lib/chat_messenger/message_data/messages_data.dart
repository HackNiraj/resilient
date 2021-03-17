import 'dart:core';
import 'package:intl/intl.dart';
import 'package:resilient/chat_messenger/message_data/user_data.dart';

class Message {
  final User sender;
  final String time;
  final String message;
  final bool isLiked;
  final bool unread;
  final DateTime date;

  Message(
      {
        this.sender,
        this.time,
        this.date,
        this.message,
        this.isLiked,
        this.unread
      });

}

final User currentUser = User(
    email: "1",
    name: 'Current User',
    imageUrl: 'assets/images/game.jpg'
);

final User steven = User(
    email: "0",
    name: 'Steven',
    imageUrl: 'assets/images/steven.jpg',
    online: true
);

final User sophia = User(
    email: "2",
    name: 'Sophia',
    imageUrl: 'assets/images/sophia.jpg',
    online: false
);

List<User> favorites = [steven, sophia];

class MessageData {
  final User sender;
  final String message;
  final DateTime time;
  final bool unread;

  MessageData(
      {
        this.sender,
        this.message,
        this.time,
        this.unread
      }
  );
}

List<Message> chats = [
  Message(
      sender: sophia,
      time: DateFormat('jm').format(DateTime.now()),
      message: 'Hey, how\'s it goin?',
      isLiked: false,
      unread: true
  ),
  Message(
      sender: steven,
      time: DateFormat('jm').format(DateTime.now()),
      message: 'its all good here',
      isLiked: true,
      unread: false
  )
];

List<Message> messages = [
  Message(
      sender: steven,//sophia,
      time: DateFormat('jm').format(DateTime.now()),
      date: DateTime.now(),
      message: 'Hey, how\'s it goin due?',
      isLiked: false,
      unread: true
  ),
  Message(
      sender: steven,
      time: '3:30 PM',
      date: DateTime.now(),
      message: 'its all good here man',
      isLiked: true,
      unread: false
  ),
  Message(
    sender: currentUser,
    time: '5:30 PM',
    date: DateTime.now(),
    message: 'Hey, how\'s it going? What did you do today? all good here',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    date: DateTime.now(),
    message: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '3:45 PM',
    date: DateTime.now(),
    message: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,//sophia,
    time: '3:15 PM',
    date: DateTime.now(),
    message: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    date: DateTime.now(),
    message: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '2:00 PM',
    date: DateTime.now(),
    message: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  )
];