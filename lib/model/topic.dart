class Topic {
  final String question;
  final String recentAnswer;
  final String answerCount;

  Topic({this.question, this.recentAnswer, this.answerCount});
}

final algorithmWorkspace = [
  Topic(
    question: "Aishat: Perfect Cube",
    recentAnswer: "An algorithm is a step by step procedure to solving a particular problem",
    answerCount: "45"
  ),
  Topic(
      question: "What's a data-structure?",
      recentAnswer: "A data-structure is a method of storing data in the computer so it can be used efficiently...",
      answerCount: "563"
  ),
];

final systemDesignWorkspace = algorithmWorkspace;