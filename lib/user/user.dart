import 'package:resilient/DateTimeHandler/date_time.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;

  User({this.id, this.name, this.imageUrl});
}

class Post {
  final User user;
  final String postTitle;
  final String imageUrl;
  final String timeStamp;

  Post({this.user, this.postTitle, this.imageUrl, this.timeStamp});
}

final User steven = User(
  id: 0,
  name: 'Steven',
  imageUrl: 'res/assets/images/steven.jpg'
);

final User sophia = User(
  id: 1,
  name: 'Sophia',
  imageUrl: 'res/assets/images/sophia.jpg'
);

List<Post> posts = [
  Post(
    user: steven,
    postTitle: "The Moon is a barren, rocky world without air and water. It has dark lava plain on its surface. The Moon is filled wit craters.\n"
        "It has no light of its own. It gets its light from the Sun. The Moo keeps changing its shape as it moves round the Earth.",
    imageUrl: "",
    timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: sophia,
      postTitle: "",
      imageUrl: "res/assets/images/worldmap.jpg",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: steven,
      postTitle: "The Moon is a barren, rocky world without air and water. It has dark lava plain on its surface. The Moon is filled wit craters.\n"
          "It has no light of its own. It gets its light from the Sun. The Moo keeps changing its shape as it moves round the Earth.",
      imageUrl: "",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: sophia,
      postTitle: "",
      imageUrl: "res/assets/images/worldmap.jpg",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: steven,
      postTitle: "The Moon is a barren, rocky world without air and water. It has dark lava plain on its surface. The Moon is filled wit craters.\n"
          "It has no light of its own. It gets its light from the Sun. The Moo keeps changing its shape as it moves round the Earth.",
      imageUrl: "",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: sophia,
      postTitle: "",
      imageUrl: "res/assets/images/worldmap.jpg",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: steven,
      postTitle: "The Moon is a barren, rocky world without air and water. It has dark lava plain on its surface. The Moon is filled wit craters.\n"
          "It has no light of its own. It gets its light from the Sun. The Moo keeps changing its shape as it moves round the Earth.",
      imageUrl: "res/assets/images/worldmap.jpg",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  ),
  Post(
      user: sophia,
      postTitle: "",
      imageUrl: "res/assets/images/worldmap.jpg",
      timeStamp: DateTimeDirectory().getVerboseDateTimeRepresentation(DateTime.now())
  )
];