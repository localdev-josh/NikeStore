import 'topic.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum ({this.title, this.imagePath, this.rank, this.threads, this.subs, this.topics});
}

final algorithmForum = Forum(
  title: "Algorithms",
  imagePath: "assets/images/algorithms.jpg",
  rank: "64",
  threads: "23",
  subs: "72",
  topics: algorithmWorkspace
);

final systemDesignForum = Forum(
    title: "System design",
    imagePath: "assets/images/system_design.jpg",
    rank: "27",
    threads: "56",
    subs: "98",
    topics: systemDesignWorkspace
);

final forums = [
  algorithmForum,
  systemDesignForum
];