class QuizBrain {
  //Private list of questions
  List<String> _questions = [
    'Prince Harry is taller than Prince William',
    'The star sign Aquarius is represented by a tiger',
    'Meryl Streep has won two Academy Awards',
    'Marrakesh is the capital of Morocco',
    'Idina Menzel sings \'let it go\' 20 times in \'Let It Go\' from Frozen',
    'Waterloo has the greatest number of tube platforms in London',
    'M&M stands for Mars and Moordale',
    'Gin is typically included in a Long Island Iced Tea',
    'The unicorn is the national animal of Scotland',
    'There are two parts of the body that can\'t heal themselves',
    'Howard Donald is the oldest member of Take That',
    'The Great Wall of China is longer than the distance between London and Beijing',
    'There are 219 episodes of Friends',
    '\'A\' is the most common letter used in the English language',
    'A lion\'s roar can be heard up to eight kilometres away',
    'In Harry Potter, Draco Malfoy has no siblings',
    'Louis Walsh is older than Simon Cowell',
    'Monaco is the smallest country in the world',
    '\'What Do You Mean\' was Justin Bieber\'s first UK number one single',
    'The river Seine in Paris is longer than the river Thames in London',
    'A cara cara navel is a type of orange',
    'There are five different blood groups',
    'Cinderella was the first Disney princess',
    'ASOS stands for As Seen On Screen',
    'The Battle Of Hastings took place in 1066',
    'H&M stands for Hennes & Mauritz',
    'Canis lupur is the scientific name for a wolf',
    'K is worth four points in Scrabble',
    'Alaska is the biggest American state in square miles',
    'Ariana Grande is 25 or under',
    'Australia is wider than the moon',
    'Queen Elizabeth II is currently the second longest reigning British monarch',
    'Madonna\'s real name is Madonna',
    'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',
    'Alexander Fleming discovered penicillin',
  ];

  //Private list of answers
  List<bool> _answers = [
    false,
    true,
    false,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
  ];

  //Properties to store current question and answer
  String _ques;
  bool _ans;

  //Private question number tracker
  int _questionNumber = 0;

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    } else {
      return;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  //Returning current question
  String getQues() {
    this._ques = this._questions[_questionNumber];
    return this._ques;
  }

  //Returning current answer
  bool getAns() {
    this._ans = this._answers[_questionNumber];
    return this._ans;
  }
}
