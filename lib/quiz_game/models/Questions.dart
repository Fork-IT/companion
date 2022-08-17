class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "They come out at night without being called and are lost in the day without being stolen. What are they ?",
    "options": ['Light', 'Bats', 'Stars', 'Flights'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Pointing to a photograph, a man said, “I have no brother or sister but that man’s father is my father’s son.” Whose photograph was it?",
    "options": ['His own', 'His Son', 'His Father', 'His Grandfather'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
