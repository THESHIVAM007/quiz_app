


class QuizQuestion {

QuizQuestion( this.text,this.answers);

final String text;
final List<String> answers;


List<String> getShuffledAnswer(){
  final shuffedList = List.of(answers);
  shuffedList.shuffle();
  return shuffedList;
}

}